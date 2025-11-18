tag @s remove milk.droplet
tag @s remove milk.splash
tag @s add milk.puddle
playsound minecraft:entity.axolotl.splash player @a[distance=0..16] ~ ~ ~ 1.0 2.0 0.0
execute on passengers store result score @s milk.temp run random value 1..4
execute on passengers if score @s milk.temp matches 1 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash1"
execute on passengers if score @s milk.temp matches 2 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash2"
execute on passengers if score @s milk.temp matches 3 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash3"
execute on passengers if score @s milk.temp matches 4 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash4"

execute store result score random milk.puddle run random value 1..7
execute if score do_fire_spawning milk.settings matches 1 if score random milk.puddle matches 3 run setblock ~ ~ ~ fire keep