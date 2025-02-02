## Forceload Chunks to New Dimension
execute in trader_dimension:pocket run forceload add 0 0 1 0

## TP Player to position when outside of the box
#execute as @a[gamemode=survival] if dimension minecraft:overworld in trader_dimension:pocket run tp @a
execute in trader_dimension:pocket positioned 6 10 6 as @e[type=!player,distance=0..20,type=!item_display,type=!marker,type=!item] at @s unless entity @p[distance=0..40] run tp @s ~ ~-1000 ~
execute in trader_dimension:pocket positioned 6 10 6 as @e[type=!player,distance=0..20,type=!item_display,type=!marker,type=!item] at @s unless entity @p[distance=0..40] run kill @s
execute in trader_dimension:pocket positioned 6 10 6 unless entity @p[distance=0..40] as @e[type=item,distance=0..100] at @s run function trader_dimension:throw_items


execute in trader_dimension:pocket positioned 6 10 6 unless entity @p[distance=0..50] unless blocks 3 0 3 12 10 12 3 90 3 all run fill 3 0 3 12 10 12 air
execute in trader_dimension:pocket unless entity @n[tag=aj.trader_dimension.root] run function trader_dimension:summon

scoreboard players add @e[tag=trader_dimension.chest_mob] trader_dimension.temp 1
execute in trader_dimension:pocket run tp @e[tag=trader_dimension.chest_mob,scores={trader_dimension.temp=300..}] ~ ~-1000 ~
kill @e[tag=trader_dimension.chest_mob,scores={trader_dimension.temp=300..}]

execute in trader_dimension:pocket positioned 8 0 8 if entity @p[distance=0..40] unless block 8 11 4 barrier run scoreboard players add timer trader_dimension.temp 1
execute unless score hard_mode wander.data matches 1 in trader_dimension:pocket if score timer trader_dimension.temp matches 60.. run function trader_dimension:spawn/init
execute unless score hard_mode wander.data matches 1 in trader_dimension:pocket if score timer trader_dimension.temp matches 60.. run scoreboard players set timer trader_dimension.temp 0
execute if score hard_mode wander.data matches 1 in trader_dimension:pocket if score timer trader_dimension.temp matches 12.. run function trader_dimension:spawn/init
execute if score hard_mode wander.data matches 1 in trader_dimension:pocket if score timer trader_dimension.temp matches 12.. run scoreboard players set timer trader_dimension.temp 0


execute in trader_dimension:pocket positioned 8 0 8 as @a[distance=0..100] store result score @s trader_dimension.temp run data get entity @s Pos[1]
execute in trader_dimension:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s trader_dimension.temp matches ..-10 unless block 8 11 4 barrier run function trader_dimension:leave
execute in trader_dimension:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s trader_dimension.temp matches ..-10 if block 8 11 4 barrier run effect give @s slow_falling 1 2 true
execute in trader_dimension:pocket positioned 8 0 8 as @a[distance=0..100] at @s if score @s trader_dimension.temp matches ..-10 if block 8 11 4 barrier run tp @s 5 10 5


execute if entity @n[tag=aj.wander.locator.chest] in trader_dimension:pocket if block 8 11 4 barrier as @n[tag=aj.trader_dimension.root,tag=!aj.trader_dimension.animation.open_chest.playing] run function animated_java:trader_dimension/animations/open_chest/play
execute unless entity @n[tag=aj.wander.locator.chest] in trader_dimension:pocket unless block 8 11 4 barrier as @n[tag=aj.trader_dimension.root,tag=!aj.trader_dimension.animation.close_chest.playing] run function animated_java:trader_dimension/animations/close_chest/play

execute store result score chest_count trader_dimension.temp if entity @e[tag=aj.trader_dimension.root]
execute if score chest_count trader_dimension.temp matches 2.. run function trader_dimension:remove
execute if score chest_count trader_dimension.temp matches 2.. run function trader_dimension:summon