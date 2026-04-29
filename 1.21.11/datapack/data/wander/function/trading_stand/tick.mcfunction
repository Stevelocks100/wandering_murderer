execute if score trading_stand_found wander.data matches 1 unless entity @s[tag=wander.trading_stand_found] run return run function wander:trading_stand/abandoned
execute if score trading_stand_found wander.data matches 0 run tag @s add wander.trading_stand_found
scoreboard players set trading_stand_found wander.data 1
execute as @a[distance=0..20,tag=!wander.near_trading_stand] at @s run function wander:trading_stand/nearby
execute as @a[tag=wander.near_trading_stand] at @s unless entity @n[tag=wander.trading_stand_spawn,distance=0..21] run function wander:trading_stand/far_away
kill @e[type=tnt,distance=0..25,nbt={fuse:1s}]

execute as @e[type=!#milk:command_entities,distance=0..22,type=!wandering_trader,type=!villager,type=!trader_llama] at @s run function wander:trading_stand/push_mob_away

execute as @a[distance=16..30] facing entity @s feet positioned ^ ^ ^20 run particle happy_villager ~ ~1.5 ~ 0.5 0.5 0.5 0 4 normal @s

execute as @a[distance=0..30] at @s if block ~ ~ ~ cyan_wool run tp @s ~ ~1 ~
execute as @a[distance=0..30] at @s if block ~ ~ ~ spruce_fence if block ~ ~-1 ~ grass_block if block ~ ~4 ~ white_carpet run tp @s ~ ~1.6 ~


execute if entity @s[tag=wander.trading_stand_active] run function wander:trading_stand/active_tick

