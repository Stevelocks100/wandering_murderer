
scoreboard players add @s milk.puddle 1

execute store result score temp milk.puddle run random value 1..20
execute if score temp milk.puddle matches 2 run particle lava ~ ~ ~ 0.6 0 0.6 0 1 normal @a

execute store result score temp milk.puddle run random value 1..20
execute if score temp milk.puddle matches 3 run particle flame ~ ~ ~ 0.6 0 0.6 0 1 normal @a




execute store result score temp milk.puddle run random value 1..100
execute if score temp milk.puddle matches 2 run playsound block.fire.ambient block @a[distance=0..32] ~ ~ ~ 2.0 1.0 0.0

execute as @e[type=!#milk:command_entities,distance=0..1.5] run damage @s 1 in_fire