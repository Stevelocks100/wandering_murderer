execute unless block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {idle:'angry_idle',move:'angry_run'}
execute if block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {idle:'swim_idle',move:'swim'}

execute if score bad_omen wander.data matches 1 as @n[tag=aj.wander.root] run function wander:ai/slaughter/set_variants


attribute @s movement_speed base set 1.5
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}

execute unless entity @p[tag=wander.target,distance=0..40] run scoreboard players set ai wander.data 25

execute unless score bad_omen wander.data matches 1 if entity @p[tag=wander.target,distance=0..3] if predicate {"condition":"minecraft:random_chance","chance":0.3} run return run scoreboard players set ai wander.data 33
execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players set ai wander.data 31

execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target] add wander.target