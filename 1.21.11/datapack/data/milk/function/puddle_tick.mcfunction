
scoreboard players add @s milk.puddle 1


execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run particle lava ~ ~ ~ 0.6 0 0.6 0 1 normal @a


execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run particle flame ~ ~ ~ 0.6 0 0.6 0 1 normal @a


execute unless entity @e[type=!#milk:command_entities,distance=0..1.5] run return 0

execute if predicate {"condition":"minecraft:random_chance","chance":0.01} run playsound block.fire.ambient block @a[distance=0..32] ~ ~ ~ 2.0 1.0 0.0
tag @s add milk.current_puddle
execute as @e[type=!#milk:command_entities,distance=0..1.5] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":10}} run function milk:damage with entity @n[tag=milk.current_puddle,distance=0..0.2] data
tag @s remove milk.current_puddle