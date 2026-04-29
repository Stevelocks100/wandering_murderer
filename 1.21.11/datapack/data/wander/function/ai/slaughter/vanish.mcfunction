
execute unless entity @p[tag=wander.potential_target,distance=0..] run return 0
scoreboard players set not_moving wander.data 0

particle minecraft:campfire_cosy_smoke ~ ~2 ~ 0.8 0.8 0.8 0.05 100 normal @a
summon item_display ~ ~ ~ {Tags:["wander.cutout","new"],item:{id:"flint",count:1,components:{"minecraft:item_model":"wander:slaughterer_cutout"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[2.75,2.75,2.75],translation:[0,4.125,0]}}
rotate @n[tag=wander.cutout,distance=0..0.1,type=item_display,tag=new] ~ 0
tag @n[tag=wander.cutout,distance=0..0.1,type=item_display,tag=new] remove new

#vanish main
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/invisible/play
scoreboard players set ai wander.fine_print 1
scoreboard players set timer wander.fine_print 10000
execute as @n[tag=aj.fine_print.root,distance=0..,type=item_display] run function animated_java:fine_print/animations/vanish/tween {frame:19,duration:2}


execute unless score ai wander.data matches 21 run playsound minecraft:entity.wandering_trader.disappeared hostile @a[distance=0..32] ~ ~ ~ 2.0 0.5 0.0
execute unless score ai wander.data matches 21 run particle effect ~ ~ ~ 1 1 1 0.01 10 normal @a

scoreboard players set ai wander.data 21
execute at @p[tag=wander.target] run spreadplayers ~ ~ 1 40 false @s
execute unless entity @p[tag=wander.target] at @p[tag=wander.potential_target] run spreadplayers ~ ~ 1 40 false @s