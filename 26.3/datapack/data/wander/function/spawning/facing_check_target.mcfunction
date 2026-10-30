# Generated with MC-Build

execute rotated ~ 0 summon item_display run function wander:temp_rotation_entity
execute store result score @s wander.temp run data get entity @s Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:"@s wander.temp",desired:"desired wander.temp",threshold:"120"}
scoreboard players operation spawn_check wander.temp = successful wander.temp