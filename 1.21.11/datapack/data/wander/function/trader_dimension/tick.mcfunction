## Forceload Chunks to New Dimension
execute in wander:pocket run forceload add -1 -1 1 1

tag @n[tag=aj.trader_dimension.root] add aj.trader_dimension.animation.trees.playing

## TP Player to position when outside of the box
#execute as @a[gamemode=survival] if dimension minecraft:overworld in wander:pocket run tp @a
execute in wander:pocket positioned 6 10 6 as @e[type=!player,distance=0..20,type=!item_display,type=!marker,type=!item] at @s unless entity @p[distance=0..40] run tp @s ~ ~-1000 ~
execute in wander:pocket positioned 6 10 6 as @e[type=!player,distance=0..20,type=!item_display,type=!marker,type=!item] at @s unless entity @p[distance=0..40] run kill @s
execute in wander:pocket positioned 6 10 6 unless entity @p[distance=0..40] as @e[type=item,distance=0..100] at @s run function wander:trader_dimension/throw_items

execute in wander:pocket unless block 8 99 4 barrier run fill 3 8 2 14 12 1 minecraft:moving_piston
execute in wander:pocket unless block 8 99 4 barrier run fill 14 8 1 13 12 14 minecraft:moving_piston
execute in wander:pocket unless block 8 99 4 barrier run fill 14 8 13 1 12 14 minecraft:moving_piston
execute in wander:pocket unless block 8 99 4 barrier run fill 2 8 13 1 12 2 minecraft:moving_piston
execute in wander:pocket as @e[type=falling_block,tag=trader_dimension.chest_mob] at @s run function wander:trader_dimension/stuck_block

execute in wander:pocket positioned 6 10 6 unless entity @p[distance=0..50] unless blocks 3 0 12 12 11 3 3 90 3 all run fill 3 0 12 12 11 3 air
execute in wander:pocket unless entity @n[tag=aj.trader_dimension.root] run function wander:trader_dimension/summon
execute in wander:pocket unless entity @n[tag=aj.trader_dimension.bone.line1] run function wander:trader_dimension/summon

scoreboard players add @e[tag=trader_dimension.chest_mob] wander.trader_dimension 1
execute in wander:pocket run tp @e[tag=trader_dimension.chest_mob,scores={wander.trader_dimension=300..}] ~ ~-1000 ~
kill @e[tag=trader_dimension.chest_mob,scores={wander.trader_dimension=300..}]

execute in wander:pocket positioned 8 0 8 if entity @p[distance=0..40] unless block 8 99 4 barrier run scoreboard players add timer wander.trader_dimension 1
execute in wander:pocket if score timer wander.trader_dimension matches 60.. run function wander:trader_dimension/spawn/init
execute in wander:pocket if score timer wander.trader_dimension matches 60.. run scoreboard players set timer wander.trader_dimension 0
execute if score bad_omen wander.data matches 1 in wander:pocket if score timer wander.trader_dimension matches 1.. run function wander:trader_dimension/spawn/init
execute if score bad_omen wander.data matches 1 in wander:pocket if score timer wander.trader_dimension matches 1.. run scoreboard players set timer wander.trader_dimension 0

execute unless block 8 99 4 barrier in wander:pocket run fill -3 12 18 18 19 -3 minecraft:moving_piston replace air
execute unless block 8 99 4 barrier in wander:pocket run fill 14 8 1 13 10 14 moving_piston replace air

execute in wander:pocket positioned 8 0 8 as @a[distance=0..100] store result score @s wander.trader_dimension run data get entity @s Pos[1]
execute in wander:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s wander.trader_dimension matches ..-10 unless block 8 99 4 barrier run function wander:trader_dimension/leave
execute in wander:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s wander.trader_dimension matches ..-10 if block 8 99 4 barrier run effect give @s slow_falling 1 2 true
execute in wander:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s wander.trader_dimension matches ..-10 if block 8 99 4 barrier run tp @s 5 10 5


execute unless score bad_omen wander.data matches 1 if entity @n[tag=aj.wander.locator.chest] in wander:pocket if block 8 99 4 barrier as @n[tag=aj.trader_dimension.root,tag=!aj.trader_dimension.animation.open_chest.playing] run function animated_java:trader_dimension/animations/open_chest/play
execute if score bad_omen wander.data matches 1 in wander:pocket if block 8 99 4 barrier as @n[tag=aj.trader_dimension.root,tag=!aj.trader_dimension.animation.open_chest.playing] run function animated_java:trader_dimension/animations/open_chest/play
execute unless score bad_omen wander.data matches 1 unless entity @n[tag=aj.wander.locator.chest] in wander:pocket unless block 8 99 4 barrier as @n[tag=aj.trader_dimension.root,tag=!aj.trader_dimension.animation.close_chest.playing] run function animated_java:trader_dimension/animations/close_chest/play

execute store result score chest_count wander.trader_dimension if entity @e[tag=aj.trader_dimension.root]
execute if score chest_count wander.trader_dimension matches 2.. run function wander:trader_dimension/remove
execute if score chest_count wander.trader_dimension matches 2.. run function wander:trader_dimension/summon

#execute in wander:pocket as @n[tag=!aj.trader_dimension.animation.trees.playing] run function animated_java:trader_dimension/animations/trees/play