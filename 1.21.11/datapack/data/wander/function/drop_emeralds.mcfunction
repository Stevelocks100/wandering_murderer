playsound wander:fine_print.swap_item hostile @a[distance=0..48] ~ ~ ~ 2.5 1.0 0.0
particle minecraft:item{item:{id:"emerald"}} ~ ~ ~ 0.2 0.4 0.2 0.4 200 normal @a
execute store result score emeralds wander.temp run random value 1..7
execute if score bad_omen wander.data matches 1.. store result score emeralds wander.temp run random value 3..12

function wander:drop_emeralds2