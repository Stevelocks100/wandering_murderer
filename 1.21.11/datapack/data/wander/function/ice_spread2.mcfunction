execute if entity @s[tag=wander.ice_spread_weaker] run return run function wander:ice_spread3
summon marker ~ ~ ~ {Tags:["wander.ice_spread","new"]}
scoreboard players remove ice_spread wander.data 1
execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run return run fill ~-1 ~-0 ~-1 ~1 ~1 ~1 frosted_ice[age=3] replace water[level=0]
execute if predicate {"condition":"minecraft:random_chance","chance":0.25} run return run fill ~-1 ~-0 ~-1 ~1 ~1 ~1 frosted_ice[age=2] replace water[level=0]
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run return run fill ~-1 ~-0 ~-1 ~1 ~1 ~1 frosted_ice[age=1] replace water[level=0]
return run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 frosted_ice replace water[level=0]
