#uses bookshelf library
#remove things like air
#add cobblestone and similar

import json
import re
from pathlib import Path

# Configuration
INPUT_FILE = Path(__file__).parent / "get_blast_resistance.json"
OUTPUT_FILE = Path(__file__).parent / "low_blast_resistance.json"

MIN_RESISTANCE = 0.0
MAX_RESISTANCE = 1.0


def get_condition_blocks(entry):
    """
    Extract the block IDs from a location_check condition.

    Returns:
        set[str] if the entry has a block condition.
        None otherwise.
    """
    condition = entry.get("condition")

    if not isinstance(condition, dict):
        return None

    if condition.get("type") != "location_check":
        return None

    predicate = condition.get("predicate", {})
    block_predicate = predicate.get("block", {})

    blocks = block_predicate.get("blocks")

    if blocks is None:
        return None

    return set(blocks)


def get_blast_resistance(entry):
    """
    Extract blast_resistance from a set_custom_data modifier.

    The input uses SNBT values such as:
        {"blast_resistance":0.25d}

    Returns a float, or None if no resistance is specified.
    """
    for modifier in entry.get("modifier", []):
        if modifier.get("type") != "set_custom_data":
            continue

        tag = modifier.get("tag", "")

        match = re.search(
            r'"blast_resistance"\s*:\s*'
            r'([-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][-+]?\d+)?)[dDfFlL]?',
            tag
        )

        if match:
            return float(match.group(1))

    return None


def evaluate_entry(entry, scope, results):
    """
    Evaluate an entry within the set of blocks it can represent.

    'scope' is the set of blocks available to this entry.
    'results' maps block IDs to their effective blast resistance.
    """
    condition_blocks = get_condition_blocks(entry)

    # Restrict this entry to the blocks specified by its condition.
    if condition_blocks is not None:
        scope = scope & condition_blocks

    if not scope:
        return

    entry_type = entry.get("type")

    if entry_type == "alternatives":
        children = entry.get("children", [])

        # Each child gets the blocks not already claimed by
        # an earlier child. This models alternatives priority.
        remaining = set(scope)

        for child in children:
            if not remaining:
                break

            child_blocks = get_condition_blocks(child)

            if child_blocks is None:
                # Unconditional fallback: receives all remaining blocks.
                child_scope = set(remaining)
            else:
                # Only blocks that remain and match this child's
                # condition can be handled by this child.
                child_scope = remaining & child_blocks

            if not child_scope:
                continue

            evaluate_entry(child, child_scope, results)

            # Earlier alternatives take priority.
            remaining -= child_scope

        return

    # Leaf entries define the actual resistance value.
    resistance = get_blast_resistance(entry)

    if resistance is None:
        if scope:
            print(
                f"WARNING: No blast resistance found for "
                f"{len(scope)} block(s) in entry: {entry.get('name', entry_type)}"
            )
        return

    for block in scope:
        results[block] = resistance


def main():
    if not INPUT_FILE.exists():
        print(f"ERROR: Input file not found: {INPUT_FILE}")
        return

    with INPUT_FILE.open("r", encoding="utf-8") as file:
        data = json.load(file)

    results = {}

    # Collect all blocks mentioned in the loot table conditions.
    all_blocks = set()

    def collect_blocks(entry):
        blocks = get_condition_blocks(entry)

        if blocks:
            all_blocks.update(blocks)

        for child in entry.get("children", []):
            collect_blocks(child)

    for pool in data.get("pools", []):
        for entry in pool.get("entries", []):
            collect_blocks(entry)

    # Evaluate the root entries against the complete block set.
    for pool in data.get("pools", []):
        for entry in pool.get("entries", []):
            evaluate_entry(entry, all_blocks, results)

    # Select blocks with resistance between the configured limits.
    matching_blocks = sorted(
        block
        for block, resistance in results.items()
        if MIN_RESISTANCE <= resistance <= MAX_RESISTANCE
    )

    # Minecraft block tag format.
    output_data = {
        "replace": False,
        "values": [
            block if ":" in block else f"minecraft:{block}"
            for block in matching_blocks
        ]
    }

    with OUTPUT_FILE.open("w", encoding="utf-8") as file:
        json.dump(output_data, file, indent=4)
        file.write("\n")

    unresolved = all_blocks - results.keys()

    print("Blast resistance extraction complete.")
    print(f"Blocks mentioned in conditions: {len(all_blocks)}")
    print(f"Blocks evaluated: {len(results)}")
    print(f"Blocks with resistance <= {MAX_RESISTANCE}: {len(matching_blocks)}")
    print(f"Blocks not evaluated: {len(unresolved)}")

    if unresolved:
        print("\nUnresolved blocks:")
        for block in sorted(unresolved):
            print(f"  {block}")

    print(f"\nOutput written to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()