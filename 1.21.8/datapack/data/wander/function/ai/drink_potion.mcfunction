#1 = invis, 2 = speed

playsound minecraft:entity.wandering_trader.disappeared hostile @a[distance=0..32] ~ ~ ~ 2.0 0.5 0.0
particle effect ~ ~ ~ 1 1 1 0.01 10 normal @a
execute as @a at @s if dimension trader_dimension:pocket run tag @s add wander.in_dimension
execute if score daytime wander.data matches -501 as @a[tag=wander.in_dimension] at @s rotated as @s run function trader_dimension:leave
tag @a remove wander.in_dimension
function wander:existance/remove
