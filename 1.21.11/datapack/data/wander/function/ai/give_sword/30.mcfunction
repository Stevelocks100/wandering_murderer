
schedule function wander:place_dimension 15s

execute unless block ~ ~ ~ #wander:water_blocks run function wander:ai/anim_states/angry_no_sword
execute if block ~ ~ ~ #wander:water_blocks run function wander:ai/anim_states/swim

#execute if score bad_omen wander.data matches 1 as @n[tag=aj.wander.root,type=item_display] run function wander:ai/slaughter/set_variants


execute if entity @p[tag=wander.potential_target] run scoreboard players set 30.no_player wander.data 0

execute unless entity @p[tag=wander.potential_target] run scoreboard players add 30.no_player wander.data 1
execute if score 30.no_player wander.data matches 200.. run function wander:ai/despawn

attribute @s movement_speed base set 1.5
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}

execute unless entity @p[tag=wander.target,distance=0..40] if entity @p[tag=wander.potential_target] run scoreboard players set ai wander.data 25

execute unless score bad_omen wander.data matches 1 if entity @p[tag=wander.target,distance=0..3] if predicate {"condition":"minecraft:random_chance","chance":0.3} run return run scoreboard players set ai wander.data 33
execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players set ai wander.data 31

execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target] add wander.target