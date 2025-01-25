tag @p[distance=0..18,tag=!wander.target,tag=wander.potential_target] add wander.selected_test
summon item_display ~ ~ ~ {Tags:["wander.stalk_rotation"]}
execute at @p[tag=wander.selected_test] run tp @n[tag=wander.stalk_rotation] ~ ~ ~ facing entity @n[tag=wander.ai]
execute store result score desired wander.temp run data get entity @n[tag=wander.stalk_rotation] Rotation[0]
execute store result score current wander.temp run data get entity @p[tag=wander.selected_test] Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:120}
kill @e[tag=wander.stalk_rotation]

tag @p[tag=wander.selected_test] remove wander.selected_test
execute if score successful wander.temp matches 1 run return 1
execute if score successful wander.temp matches 0 run return 0
return 0
