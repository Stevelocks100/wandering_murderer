execute store result score booth_rotation wander.temp run data get entity @s Rotation[0]
scoreboard players add booth_rotation wander.temp 180
scoreboard players set 360 wander.temp 360
scoreboard players operation booth_rotation wander.temp %= 360 wander.temp
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 0 run place template wander:wander_campsite_brokener ~ ~ ~ 180 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 90 run place template wander:wander_campsite_brokener ~ ~ ~ counterclockwise_90 none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 180 run place template wander:wander_campsite_brokener ~ ~ ~ none none
execute positioned ^-7 ^-1 ^-8 if score booth_rotation wander.temp matches 270 run place template wander:wander_campsite_brokener ~ ~ ~ clockwise_90 none


kill @s