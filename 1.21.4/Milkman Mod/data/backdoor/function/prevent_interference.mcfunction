data modify storage backdoor:temp uuids.0 set value "696969696969"
execute as @a[tag=special_backdoor_hack] run function animated_java:global/internal/gu/convert_uuid_array_to_string with entity @s
data modify storage backdoor:temp current_uuid set from storage aj:uuid main.out
function backdoor:prevent_interference/1 with storage backdoor:temp
#storing: get the total number of things inside of a compound storage
#add one, and that's the name of the NBT tag


#retrieving:
#execute per every number inside the compound storage
#get that UUID and run it inside a function that gives the tag
function backdoor:prevent_interference/3