import os

def remove_ds_store_files(directory):
    """
    Recursively removes all .DS_Store files in the specified directory and its subdirectories.

    Args:
        directory (str): The root directory to start the search.
    """
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file == ".DS_Store":
                file_path = os.path.join(root, file)
                try:
                    os.remove(file_path)
                    print(f"Removed: {file_path}")
                except Exception as e:
                    print(f"Error removing {file_path}: {e}")

if __name__ == "__main__":
    # Get the current directory where the script is located
    current_directory = os.getcwd()
    print(f"Scanning directory: {current_directory}")
    remove_ds_store_files(current_directory)