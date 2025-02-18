execute if score ice_spread wander.data matches 1.. if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~2 ~ ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~-2 ~ ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~2 ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if predicate {"condition":"minecraft:random_chance","chance":0.1} if score ice_spread wander.data matches 1.. positioned ~ ~-2 ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~ ~2 unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~ ~-2 unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2

kill @s