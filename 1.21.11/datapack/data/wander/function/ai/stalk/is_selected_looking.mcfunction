tag @p[distance=0..18,tag=!wander.target,tag=wander.potential_target] add wander.selected_test
execute at @p[tag=wander.selected_test] facing entity abb5e532-ba94-447e-8b50-7b463008a14c eyes summon item_display run function wander:temp_rotation_entity
execute store result score current wander.temp run data get entity @p[tag=wander.selected_test] Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:120}


tag @p[tag=wander.selected_test] remove wander.selected_test
execute if score successful wander.temp matches 1 run return 1
return 0
