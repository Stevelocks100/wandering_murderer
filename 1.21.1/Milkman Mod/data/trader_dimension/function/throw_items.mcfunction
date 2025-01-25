execute in minecraft:overworld if entity @n[tag=wander.ai] at @n[tag=wander.ai] run tp @s ~ ~2 ~
execute in minecraft:overworld if entity @n[tag=wander.ai] store result entity @s Motion[0] double 0.01 run random value -100..100
execute in minecraft:overworld if entity @n[tag=wander.ai] store result entity @s Motion[1] double 0.01 run random value 20..100
execute in minecraft:overworld if entity @n[tag=wander.ai] store result entity @s Motion[2] double 0.01 run random value -100..100