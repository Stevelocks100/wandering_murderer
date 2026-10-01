
execute store result score @s milk.dropped run data get entity @s equipment.offhand.components."minecraft:custom_data".bottles
execute if score @s milk.dropped matches 4 run return 0

execute positioned ~ ~1.5 ~ as @n[type=item,nbt={Age:0s}] unless data entity @s Item.components."minecraft:custom_data".milk run return 0
execute positioned ~ ~1.5 ~ as @n[type=item,nbt={Age:0s}] if data entity @s Item.components."minecraft:custom_data".milk run kill @s

item modify entity @s[scores={milk.dropped=0}] weapon.offhand milk:crates/1
item modify entity @s[scores={milk.dropped=1}] weapon.offhand milk:crates/2
item modify entity @s[scores={milk.dropped=2}] weapon.offhand milk:crates/3
item modify entity @s[scores={milk.dropped=3}] weapon.offhand milk:crates/4
