execute unless block ~ ~ ~ #wander:water_blocks run function wander:ai/anim_states/sneak
execute if block ~ ~ ~ #wander:water_blocks run function wander:ai/anim_states/swim

attribute @s movement_speed base set 1.0
function wander:ai/pathfind_macro {target:"@p[tag=wander.target]"}

execute if function wander:ai/stalk/is_target_looking run scoreboard players set standoff wander.data 50
execute if function wander:ai/stalk/is_target_looking run scoreboard players set ai wander.data 1


execute if entity @p[tag=wander.target,distance=0..3] if entity @s[predicate=wander:on_ground] run function wander:ai/follow/select_action


