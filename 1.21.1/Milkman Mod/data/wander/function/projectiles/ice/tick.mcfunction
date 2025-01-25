





execute if entity @s[nbt={inGround:1b}] on passengers run function wander:projectiles/ice/convert_nearby_water
execute if entity @s[nbt={inGround:1b}] on passengers run kill @s
execute if entity @s[nbt={inGround:1b}] run kill @s

execute if block ~ ~ ~ #wander:water_ish on passengers run kill @s
execute if block ~ ~ ~ #wander:water_ish align xyz positioned ~0.5 ~0.5 ~0.5 run playsound entity.zombie_villager.cure block @a[distance=0..32] ~ ~ ~ 2.0 0.8 0.0
execute if block ~ ~ ~ #wander:water_ish align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set ice_spread wander.data 1000
execute if block ~ ~ ~ #wander:water_ish align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:["wander.ice_spread"]}
execute if block ~ ~ ~ #wander:water_ish run kill @s

