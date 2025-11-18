tag @s remove milk.droplet
tag @s remove milk.splash
tag @s add milk.puddle
playsound minecraft:entity.axolotl.splash player @a[distance=0..16] ~ ~ ~ 1.0 2.0 0.0
execute on passengers store result entity @s item.components."minecraft:custom_model_data" int 1 run random value 735..738
execute store result score random milk.puddle run random value 1..7
execute if score do_fire_spawning milk.settings matches 1 if score random milk.puddle matches 3 run setblock ~ ~ ~ fire keep