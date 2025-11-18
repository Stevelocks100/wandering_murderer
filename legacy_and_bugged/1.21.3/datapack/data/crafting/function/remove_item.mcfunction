data remove entity @s attack

execute on passengers unless data entity @s item run return 0
execute at @s positioned ~ ~-0.1 ~ run summon item ~ ~ ~ {Item:{id:"minecraft:stone_button",count:1},Motion:[0.0d,0.2d,0.0d],Tags:["crafting.give_item_back"]}
execute on passengers run tag @s add crafting.item_in_slot
data modify entity @n[tag=crafting.give_item_back] Item set from entity @n[tag=crafting.item_in_slot] item
data modify entity @n[tag=crafting.give_item_back] Owner set from entity @p UUID
execute on passengers run data remove entity @s item
execute on passengers run tag @s remove crafting.item_in_slot
