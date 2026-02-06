function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
attribute @s movement_speed base set 0
function wander:dimension_players_check

execute in trader_dimension:pocket positioned 8 0 8 as @a[distance=0..100] at @s if dimension trader_dimension:pocket run tag @s add wander.in_dimension
execute store result score dimension_count wander.data if entity @a[tag=wander.in_dimension]
tag @a remove wander.in_dimension
execute if score dimension_count wander.data matches 0 run function wander:ai/stalk/drink_potion
execute if score dimension wander.temp matches 1.. if score daytime wander.data matches -501 run return 0
execute if entity @p[tag=wander.potential_target,distance=0..10] run forceload remove ~ ~
execute if entity @p[tag=wander.potential_target,distance=0..10] run function wander:ai/stalk/drink_potion

execute if block ~ ~ ~ #minecraft:ice run function wander:ai/destroy_nearby/init
