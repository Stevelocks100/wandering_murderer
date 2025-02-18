tag @s remove milk.droplet
tag @s remove milk.splash
tag @s add milk.puddle
playsound minecraft:entity.axolotl.splash player @a[distance=0..16] ~ ~ ~ 1.0 2.0 0.0
execute on passengers store result score @s milk.crate_progress run random value 735..738
execute on passengers if score @s milk.crate_progress matches 735 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash1"
execute on passengers if score @s milk.crate_progress matches 736 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash2"
execute on passengers if score @s milk.crate_progress matches 737 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash3"
execute on passengers if score @s milk.crate_progress matches 738 run data modify entity @s item.components."minecraft:item_model" set value "wander:splash4"

execute store result score random milk.puddle run random value 1..7
execute if score random milk.puddle matches 3 run setblock ~ ~ ~ fire keep