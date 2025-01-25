import os
import json

# Define source and target directories
source_dir = "models/item"
target_dir = "items"

# Traverse the source directory
for root, dirs, files in os.walk(source_dir):
    # Preserve folder structure
    relative_path = os.path.relpath(root, source_dir)
    target_path = os.path.join(target_dir, relative_path)
    os.makedirs(target_path, exist_ok=True)

    for file in files:
        if file.endswith(".json"):
            # Construct source and target file paths
            source_file = os.path.join(root, file)
            target_file = os.path.join(target_path, file)

            # Generate the new JSON content
            model_name = os.path.splitext(file)[0]

            # Adjust the `model.model` string to include "wander:item/" prefix and relative folder structure
            folder_structure = relative_path.replace("\\", "/")  # Handle Windows paths
            if folder_structure != ".":
                model_value = f"wander:item/{folder_structure}/{model_name}"
            else:
                model_value = f"wander:item/{model_name}"

            # Create the new JSON structure
            new_data = {
                "model": {
                    "type": "minecraft:model",
                    "model": model_value,
                }
            }

            # Write the transformed JSON to the target file
            with open(target_file, "w") as f:
                json.dump(new_data, f, indent=4)

            print(f"Created: {target_file}")