execute unless data block ~ -64 ~-1 Items[0] run return 0
summon item ~ ~3 ~ {Item:{id:"structure_void",count:1},Tags:["crafting.result","new"],Motion:[0.0d,0.2d,0.0d]}
data modify entity @n[tag=crafting.result] Item set from block ~ -64 ~-1 Items[0]
data modify entity @n[tag=crafting.result] Pos[1] set from entity @s data.pos
execute if data entity @n[tag=crafting.result,tag=new] Item{id:"minecraft:structure_void"} run kill @n[tag=crafting.result,tag=new]
tag @n[tag=crafting.result,tag=new] remove new


