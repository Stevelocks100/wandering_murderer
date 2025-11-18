execute store result score count backdoor.temp run data get storage backdoor:temp uuids
execute store result storage backdoor:temp current_count int 1 run scoreboard players get count backdoor.temp
function backdoor:prevent_interference/4 with storage backdoor:temp