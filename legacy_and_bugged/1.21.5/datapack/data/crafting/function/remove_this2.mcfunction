
execute if data entity @s item run summon item ~ ~0.1 ~ {Motion:[0.0d,0.2d,0.0d],Tags:["crafting.removing_item","new"],Item:{id:"minecraft:stick",count:1}}
execute if data entity @s item run data modify entity @n[tag=crafting.removing_item,tag=new] Item set from entity @s item
execute if data entity @s item run tag @n[tag=crafting.removing_item,tag=new] remove new