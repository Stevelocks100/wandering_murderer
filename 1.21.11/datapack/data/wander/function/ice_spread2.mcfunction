summon marker ~ ~ ~ {Tags:["wander.ice_spread","new"]}
scoreboard players remove ice_spread wander.data 1
execute if predicate {"condition":"minecraft:random_chance","chance":0.1} run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 frosted_ice[age=3] replace water[level=0]
execute if predicate {"condition":"minecraft:random_chance","chance":0.25} run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 frosted_ice[age=2] replace water[level=0]
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 frosted_ice[age=1] replace water[level=0]
fill ~-1 ~-1 ~-1 ~1 ~1 ~1 frosted_ice replace water[level=0]
