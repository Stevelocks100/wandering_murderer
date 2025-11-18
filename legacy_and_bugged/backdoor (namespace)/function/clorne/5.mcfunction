$execute at @s run data modify entity @n[type=item,distance=0..5] Item set from entity @p[tag=backdoor.current_uuid] Inventory[$(current_index)]
tellraw @s "yyyyyoink!\nNice job clorning an item :D"

scoreboard players set @s backdoor.trigger 0
scoreboard players set @s backdoor.clorne 0
tag @a remove backdoor.current_uuid