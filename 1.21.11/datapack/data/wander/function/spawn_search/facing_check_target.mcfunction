summon item_display ~ ~ ~ {Tags:["wander.spawn_facing_check"]}
tp @n[tag=wander.spawn_facing_check] ~ ~ ~ ~ 0
execute store result score @s wander.temp run data get entity @s Rotation[0]
execute store result score desired wander.temp run data get entity @n[tag=wander.spawn_facing_check] Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:"@s wander.temp",desired:"desired wander.temp",threshold:"120"}

scoreboard players operation spawn_check wander.temp = successful wander.temp
kill @e[tag=wander.spawn_facing_check]