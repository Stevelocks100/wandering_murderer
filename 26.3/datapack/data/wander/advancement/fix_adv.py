import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent

# Preview changes first. Set to False to apply them.
DRY_RUN = False

# Back up modified files before writing.
CREATE_BACKUPS = False


def parse_nbt_tags(nbt):
    """
    Extract Tags from a simple entity NBT predicate.

    Supports:
        {Tags:["tag_here"]}
        {Tags:["tag_one","tag_two"]}

    Returns:
        list[str] if Tags is the only NBT field.
        None otherwise.
    """
    if not isinstance(nbt, str):
        return None

    # Match the complete NBT compound, containing only Tags.
    match = re.fullmatch(
        r'\s*\{\s*Tags\s*:\s*\[(.*?)\]\s*\}\s*',
        nbt,
        re.DOTALL
    )

    if not match:
        return None

    contents = match.group(1)

    # Extract quoted string values.
    tags = re.findall(r'"((?:\\.|[^"\\])*)"', contents)

    # Remove the strings and commas; anything remaining is unsupported.
    remainder = re.sub(r'"(?:\\.|[^"\\])*"', "", contents)
    remainder = remainder.replace(",", "").strip()

    if remainder:
        return None

    if not tags:
        return None

    return tags


def walk(node, path="$"):
    """Recursively walk JSON and yield each dictionary."""
    if isinstance(node, dict):
        yield node, path

        for key, value in node.items():
            yield from walk(value, f"{path}.{key}")

    elif isinstance(node, list):
        for index, value in enumerate(node):
            yield from walk(value, f"{path}[{index}]")


def process_file(file_path):
    with file_path.open("r", encoding="utf-8") as f:
        data = json.load(f)

    replacements = 0
    unsupported = []

    # Snapshot the dictionaries because we may modify them.
    for obj, json_path in list(walk(data)):
        if "nbt" not in obj:
            continue

        nbt = obj["nbt"]
        tags = parse_nbt_tags(nbt)

        if tags is None:
            unsupported.append((json_path, nbt))
            continue

        # Replace the NBT check with direct entity tag checks.
        del obj["nbt"]
        obj["entity_tags"] = {
            "all_of": tags
        }

        replacements += 1

    if replacements and not DRY_RUN:
        if CREATE_BACKUPS:
            backup_path = file_path.with_suffix(
                file_path.suffix + ".bak"
            )

            if not backup_path.exists():
                import shutil
                shutil.copy2(file_path, backup_path)

        with file_path.open("w", encoding="utf-8") as f:
            json.dump(data, f, indent=4, ensure_ascii=False)
            f.write("\n")

    return replacements, unsupported


def main():
    total_files = 0
    total_replacements = 0
    total_unsupported = 0

    for file_path in ROOT.rglob("*.json"):
        # Don't process backup files.
        if file_path.name.endswith(".bak"):
            continue

        try:
            replacements, unsupported = process_file(file_path)
        except (json.JSONDecodeError, UnicodeDecodeError) as e:
            print(f"[ERROR] {file_path}: {e}")
            continue

        total_files += 1
        total_replacements += replacements
        total_unsupported += len(unsupported)

        if replacements:
            prefix = "[DRY RUN] " if DRY_RUN else ""
            print(
                f"{prefix}{file_path}: "
                f"{replacements} replacement(s)"
            )

        for json_path, nbt in unsupported:
            print(f"\n[UNSUPPORTED NBT] {file_path}")
            print(f"  JSON path: {json_path}")
            print(f"  NBT:      {nbt}")

    print("\n========== SUMMARY ==========")
    print(f"Files scanned:              {total_files}")
    print(f"NBT predicates replaceable: {total_replacements}")
    print(f"NBT predicates unsupported: {total_unsupported}")

    if DRY_RUN:
        print("\nDry run only. Set DRY_RUN = False to apply changes.")
    elif CREATE_BACKUPS:
        print("Backups saved as *.json.bak")


if __name__ == "__main__":
    main()