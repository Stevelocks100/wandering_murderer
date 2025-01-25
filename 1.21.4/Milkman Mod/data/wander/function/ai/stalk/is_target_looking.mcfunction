
summon item_display ~ ~ ~ {Tags:["wander.stalk_rotation"]}
execute at @p[tag=wander.target] run tp @n[tag=wander.stalk_rotation] ~ ~ ~ facing entity @n[tag=wander.ai]
execute store result score desired wander.temp run data get entity @n[tag=wander.stalk_rotation] Rotation[0]
execute store result score current wander.temp run data get entity @p[tag=wander.target] Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:120}
kill @e[tag=wander.stalk_rotation]


execute if score successful wander.temp matches 1 run return 1
execute if score successful wander.temp matches 0 run return 0
return 0