tag @s remove wander.trading_stand_active

particle minecraft:campfire_cosy_smoke ^2 ^5 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^4 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^3 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^2 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^1 ^-2 2.0 0 2.0 0.1 500 normal @a

execute as @a[distance=0..40,tag=wander.near_trading_stand] run function wander:trading_stand/far_away

playsound wander:wandering_murderer.bag hostile @a[distance=0..50] ~ ~ ~ 3.0 1.0 0.3

execute as @e[tag=wander.trading_stand_item,distance=0..10,type=item_display] at @s run function wander:trading_stand/item/remove

execute as @n[tag=aj.wander.root,distance=0..10] run function animated_java:wander/animations/jump_despawn/tween {duration:6,to_frame:0}
fill ^-7 ^-1 ^-8 ^13 ^5 ^5 air strict

kill @e[tag=wander.stall.sword,distance=0..20]
kill @e[tag=wander.stall.bag,distance=0..20]
kill @e[tag=wander.head_collection_location,distance=0..20]

execute store result score booth_rotation wander.temp run data get entity @s Rotation[0]
scoreboard players add booth_rotation wander.temp 180
scoreboard players set 360 wander.temp 360
scoreboard players operation booth_rotation wander.temp %= 360 wander.temp
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 0 run place template wander:wander_campsite_broken_no_jigsaw ~ ~ ~ 180 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 90 run place template wander:wander_campsite_broken_no_jigsaw ~ ~ ~ counterclockwise_90 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 180 run place template wander:wander_campsite_broken_no_jigsaw ~ ~ ~ none none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 270 run place template wander:wander_campsite_broken_no_jigsaw ~ ~ ~ clockwise_90 none


tag @s add wander.current_entity
kill @e[tag=wander.trading_stand_spawn,tag=!wander.current_entity,distance=0..0.5]
tag @s add wander.current_entity
