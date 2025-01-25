execute store result score index backdoor.temp run data get storage backdoor:temp current_index
scoreboard players operation index backdoor.temp += @s backdoor.trigger
scoreboard players set @s backdoor.trigger -999
execute store result storage backdoor:temp current_index int 1 run scoreboard players get index backdoor.temp
function backdoor:clorne/read_item with storage backdoor:temp
tellraw @s "\n\nUse -9..9 to go up/down in the inventory\nUse 0 to clorne"