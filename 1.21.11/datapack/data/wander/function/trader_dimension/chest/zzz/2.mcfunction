# Generated with MC-Build

execute if score bad_omen wander.data matches 1 unless entity @s[type=!zombie,type=!skeleton] run function wander:trader_dimension/gear/random_gear
execute store result entity @s Motion[0] double 0.1 run random value 3..8
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} store result entity @s Motion[0] double 0.1 run random value -8..-3
execute store result entity @s Motion[1] double 0.1 run random value 3..8
execute store result entity @s Motion[2] double 0.1 run random value 3..8
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} store result entity @s Motion[2] double 0.1 run random value -8..-3
tag @s remove wander.trader_dimension.new