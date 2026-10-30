scoreboard players set @s wander.placed_armor_stand 0


execute as @e[tag=wander.spawn_egg,type=armor_stand] at @s rotated as @s run function wander:spawn_egg/summon

execute as @e[tag=wander.placeable_cutout_stand,type=armor_stand] at @s rotated as @s run function wander:placeable_cutout/place

execute if entity @n[tag=wander.spawn_egg,type=armor_stand] if entity @s[type=player] run tellraw @s "This will spawn when a valid target exists."
execute if entity @n[tag=wander.spawn_egg,type=armor_stand] run schedule function wander:placed_armor_stand 5t