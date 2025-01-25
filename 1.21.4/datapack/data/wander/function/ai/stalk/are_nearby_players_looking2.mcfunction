execute as @a[tag=wander.potential_target,distance=0..40] run function wander:ai/stalk/are_nearby_players_looking2
summon item_display ~ ~ ~ {Tags:["wander.stalk_rotation"]}
execute at @s run tp @n[tag=wander.stalk_rotation] ~ ~ ~ facing entity @n[tag=wander.ai]
execute store result score desired wander.temp run data get entity @n[tag=wander.stalk_rotation] Rotation[0]
execute store result score current wander.temp run data get entity @s Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:70}
kill @e[tag=wander.stalk_rotation]

execute if score successful wander.temp matches 1 run scoreboard players set nearby_facing wander.temp 1