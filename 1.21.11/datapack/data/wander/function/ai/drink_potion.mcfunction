#1 = invis, 2 = speed

playsound minecraft:entity.wandering_trader.disappeared hostile @a[distance=0..32] ~ ~ ~ 2.0 0.5 0.0
particle effect ~ ~ ~ 1 1 1 0.01 10 normal @a

execute if score daytime wander.data matches -501 in wander:pocket as @a[x=0] at @s rotated as @s run function wander:trader_dimension/leave
tag @a remove wander.in_dimension
function wander:existence/remove
