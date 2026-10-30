playsound minecraft:entity.wandering_trader.reappeared hostile @a[distance=0..32] ~ ~ ~ 0.5 0.5 0.0
scoreboard players set ai wander.data 20
scoreboard players set start_phase3 wander.data 0
particle minecraft:campfire_cosy_smoke ~ ~2 ~ 0.8 0.8 0.8 0.05 100 normal @a

execute if score timer wander.fine_print matches 100.. run scoreboard players set timer wander.fine_print 100
