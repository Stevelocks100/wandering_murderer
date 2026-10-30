import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
TAG_DIR = ROOT / "block"
ALL_BLOCKS_FILE = ROOT / "all_blocks.json"
OUTPUT_FILE = ROOT / "can_pass.json"

# Minecraft tag files are stored relative to the block/ directory.
# Example: #minecraft:replaceable -> block/replaceable.json
#          #minecraft:mineable/pickaxe -> block/mineable/pickaxe.json


def load_json(path):
    with path.open("r", encoding="utf-8") as file:
        return json.load(file)


def resolve_tag(tag_name, stack=None):
    """Resolve a block tag and all nested tag references."""
    if stack is None:
        stack = set()

    # Remove the leading # and optional minecraft: namespace.
    if not tag_name.startswith("#"):
        raise ValueError(f"Expected tag reference, got: {tag_name}")

    tag_name = tag_name[1:]

    if tag_name.startswith("minecraft:"):
        tag_name = tag_name[len("minecraft:"):]

    tag_path = (TAG_DIR / f"{tag_name}.json").resolve()

    # Ensure references stay inside the tag directory.
    if not tag_path.is_relative_to(TAG_DIR.resolve()):
        raise ValueError(f"Invalid tag path: {tag_name}")

    if tag_name in stack:
        print(f"Warning: Circular tag reference detected: {tag_name}")
        return set()

    if not tag_path.is_file():
        raise FileNotFoundError(f"Missing tag: {tag_name} ({tag_path})")

    data = load_json(tag_path)
    values = data.get("values", [])

    blocks = set()
    next_stack = stack | {tag_name}

    for entry in values:
        if isinstance(entry, str):
            if entry.startswith("#"):
                blocks.update(resolve_tag(entry, next_stack))
            else:
                blocks.add(entry)

        elif isinstance(entry, dict):
            entry_id = entry.get("id")

            if not isinstance(entry_id, str):
                continue

            if entry_id.startswith("#"):
                try:
                    blocks.update(resolve_tag(entry_id, next_stack))
                except FileNotFoundError:
                    if entry.get("required", True):
                        raise
                    print(f"Skipping missing optional tag: {entry_id}")
            else:
                blocks.add(entry_id)

    return blocks


def extract_all_blocks(data):
    """Extract block IDs from all_blocks.json."""
    blocks = set()

    def recurse(node):
        if isinstance(node, str):
            blocks.add(node)

        elif isinstance(node, list):
            for item in node:
                recurse(item)

        elif isinstance(node, dict):
            if isinstance(node.get("id"), str):
                blocks.add(node["id"])
            else:
                for value in node.values():
                    recurse(value)

    recurse(data)
    return blocks


def main():
    all_blocks_data = load_json(ALL_BLOCKS_FILE)
    all_blocks = extract_all_blocks(all_blocks_data)

    print("Resolving blocks_motion tag...")
    blocks_motion = resolve_tag("#minecraft:blocks_motion")

    # Only include blocks that exist in all_blocks.json.
    # Normalize IDs before comparing.
    all_blocks = {b.removeprefix("minecraft:") for b in all_blocks}
    blocks_motion = {b.removeprefix("minecraft:") for b in blocks_motion}

    can_pass = sorted(all_blocks - blocks_motion)

    print(f"Overlap: {len(all_blocks & blocks_motion)}")
    print(f"All blocks: {len(all_blocks)}")
    print(f"Blocks that block motion: {len(blocks_motion)}")
    print(f"Blocks that can be passed: {len(can_pass)}")

    with OUTPUT_FILE.open("w", encoding="utf-8") as file:
        json.dump({"values": can_pass}, file, indent=2)

    print()
    print(f"All blocks:              {len(all_blocks)}")
    print(f"Blocks that block motion: {len(blocks_motion)}")
    print(f"Blocks that can be passed: {len(can_pass)}")
    print(f"Output: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()