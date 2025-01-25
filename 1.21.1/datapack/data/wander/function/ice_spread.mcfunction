execute if score ice_spread wander.data matches 1.. if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~1 ~ ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~-1 ~ ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~1 ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~-1 ~ unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~ ~1 unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2


execute if score ice_spread wander.data matches 1.. positioned ~ ~ ~-1 unless entity @n[tag=wander.ice_spread,distance=0..0.2] if block ~ ~ ~ #wander:water_ish run function wander:ice_spread2

kill @s