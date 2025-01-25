# ASCII list from 32 to 127
ascii_characters = [chr(i) for i in range(32, 128)]

# Function to convert a string into formatted ASCII chunks
def string_to_ascii_chunks(input_string):
    ascii_numbers = ""
    max_int_32 = 2_147_483_647  # 32-bit integer limit

    # Convert each character to its ASCII index and format as a two-digit string
    for char in input_string:
        if char == " ":
            # Special case for space
            ascii_numbers += "95"
        elif 32 <= ord(char) < 128:
            ascii_index = ord(char) - 32
            ascii_numbers += f"{ascii_index:02}"
        else:
            raise ValueError(f"Character '{char}' is not in the supported ASCII range!")

    # Split the ASCII string into chunks that fit within the 32-bit integer limit
    chunks = []
    current_chunk = ""
    for number in ascii_numbers:
        if current_chunk == "" or int(current_chunk + number) <= max_int_32:
            current_chunk += number
        else:
            chunks.append(current_chunk)
            current_chunk = number  # Start a new chunk with the current number

    # Append the last chunk if it's non-empty
    if current_chunk:
        chunks.append(current_chunk)

    return chunks

# Get user input
input_string = input("Enter a string: ")

try:
    # Convert the string to ASCII chunks
    ascii_chunks = string_to_ascii_chunks(input_string)
    
    # Print each chunk
    print("ASCII chunks:")
    for chunk in ascii_chunks:
        print(chunk)
except ValueError as e:
    print(e)