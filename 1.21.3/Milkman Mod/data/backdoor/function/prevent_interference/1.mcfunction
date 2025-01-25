execute store result score count backdoor.temp run data get storage backdoor:temp convert_uuid_array_to_string
scoreboard players add count backdoor.temp 1
execute store result storage backdoor:temp count int 1 run scoreboard players get count backdoor.temp
function backdoor:prevent_interference/2 with storage backdoor:temp