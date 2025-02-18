execute unless block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {idle:'angry_idle',move:'angry_run'}
execute if block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {idle:'swim_idle',move:'swim'}

attribute @s generic.movement_speed base set 1.5
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute if entity @p[tag=wander.target,distance=0..5] run scoreboard players set ai wander.data 31

execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target] add wander.target