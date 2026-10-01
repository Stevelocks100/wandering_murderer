# stand there until stared at.

scoreboard players set quiet_spawn wander.data 0

execute unless block ~ ~-0.1 ~ #wander:water_blocks if entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/angry_no_sword
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/angry_sword
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~2.5 ~ #wander:can_pass run function wander:ai/anim_states/sneak
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~3.5 ~ #wander:can_pass run function wander:ai/anim_states/sneak
execute if block ~ ~-0.3 ~ #wander:water_blocks run function wander:ai/anim_states/swim

# function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}


tag @a remove wander.target
attribute @s movement_speed base set 0

execute if predicate {"condition":"minecraft:all_of","terms":[{"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":20}},{"condition":"minecraft:random_chance","chance":0.04}]} run scoreboard players set ai wander.data 20
execute if function wander:ai/attack/are_nearby_players_looking run return run scoreboard players set ai wander.data 20
execute if entity @p[tag=wander.potential_target,distance=0..1.8] run tag @p[tag=wander.potential_target] add wander.target
execute if entity @p[tag=wander.potential_target,distance=0..1.8] run scoreboard players set ai wander.data 20

execute unless entity @p[tag=wander.potential_target,distance=0..20] run tag @p[tag=wander.potential_target] add wander.target
execute unless entity @p[tag=wander.potential_target,distance=0..20] run scoreboard players set ai wander.data 20