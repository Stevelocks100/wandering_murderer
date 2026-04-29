execute if entity @s[tag=wander.thrown_items] run return 0
execute in minecraft:overworld if score spawned wander.data matches 1 at @n[tag=wander.ai] run tp @s ~ ~2 ~
execute in minecraft:overworld if score spawned wander.data matches 1 store result entity @s Motion[0] double 0.01 run random value -100..100
execute in minecraft:overworld if score spawned wander.data matches 1 store result entity @s Motion[1] double 0.01 run random value 20..100
execute in minecraft:overworld if score spawned wander.data matches 1 store result entity @s Motion[2] double 0.01 run random value -100..100
execute in minecraft:overworld if score spawned wander.data matches 1 run tag @s add wander.thrown_items