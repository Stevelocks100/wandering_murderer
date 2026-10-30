# Generated with MC-Build

execute unless score @s wander.trader_dimension.scale matches 21.. run scoreboard players add @s wander.trader_dimension.scale 1
execute unless score @s wander.trader_dimension.scale matches 21.. store result entity @s attributes[{id:"minecraft:scale"}].base float 0.05 run scoreboard players get @s wander.trader_dimension.scale
scoreboard players add @s wander.trader_dimension.mob_duration 1
execute if score @s wander.trader_dimension.mob_duration matches 400.. run function wander:trader_dimension/chest/zzz/1