tag @s add wander.trading_stand_active

particle minecraft:campfire_cosy_smoke ^2 ^5 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^4 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^3 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^2 ^-2 2.0 0 2.0 0.1 500 normal @a
particle minecraft:campfire_cosy_smoke ^2 ^1 ^-2 2.0 0 2.0 0.1 500 normal @a

playsound wander:wandering_murderer.bag hostile @a[distance=0..50] ~ ~ ~ 3.0 1.0 0.3

function wander:trading_stand/create_trade_items
execute if data storage wander:trades main_offers[0] positioned ^-1 ^1 ^1.5 run function wander:trading_stand/item/summon with storage wander:trades main_offers[0]
execute if data storage wander:trades main_offers[1] positioned ^ ^1 ^1.5 run function wander:trading_stand/item/summon with storage wander:trades main_offers[1]
execute if data storage wander:trades main_offers[2] positioned ^1 ^1 ^1.5 run function wander:trading_stand/item/summon with storage wander:trades main_offers[2]


function animated_java:wander/summon {args:{animation:'sit',start_animation:true}}
particle effect ~ ~ ~ 1 1 1 0.01 10 normal @a
playsound entity.wandering_trader.reappeared hostile @a[distance=0..70] ~ ~ ~ 1.0 0.6 0.3

fill ^-7 ^-1 ^-8 ^13 ^5 ^5 air strict

execute store result score booth_rotation wander.temp run data get entity @s Rotation[0]
scoreboard players add booth_rotation wander.temp 180
scoreboard players set 360 wander.temp 360
scoreboard players operation booth_rotation wander.temp %= 360 wander.temp
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 0 run place template wander:wander_campsite ~ ~ ~ 180 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 90 run place template wander:wander_campsite ~ ~ ~ counterclockwise_90 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 180 run place template wander:wander_campsite ~ ~ ~ none none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 270 run place template wander:wander_campsite ~ ~ ~ clockwise_90 none

tag @s add wander.current_entity
kill @e[tag=wander.trading_stand_spawn,tag=!wander.current_entity,distance=0..0.5]
tag @s add wander.current_entity

execute as @n[tag=wander.head_collection_location,distance=0..20] at @s rotated as @s run function wander:head_collection