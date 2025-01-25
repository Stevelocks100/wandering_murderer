data modify storage backdoor:temp current_uuid set from storage backdoor:temp uuids.$(current_count)
function backdoor:prevent_interference/5 with storage backdoor:temp

execute store result score count backdoor.temp run data get storage backdoor:temp current_count
execute store result storage backdoor:temp current_count int 1 run scoreboard players remove count backdoor.temp 1

execute if score count backdoor.temp matches 1.. run function backdoor:prevent_interference/4