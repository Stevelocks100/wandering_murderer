execute store result storage backdoor:temp current_index int 1 run scoreboard players get @s backdoor.trigger
scoreboard players set @s backdoor.trigger -999
scoreboard players set @s backdoor.clorne 3
function backdoor:clorne/read_item with storage backdoor:temp
tellraw @s "\n\nUse -9..9 to go up/down in the inventory\nUse 0 to clorne (WARNING: WILL REPLACE NEAREST ITEM REGARDLESS OF WHAT IT IS)"