function wander:ai/animation_macro {move:'angry_idle',idle:'angry_idle'}
attribute @s movement_speed base set 1.2
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute if entity @p[tag=wander.target,distance=0..3] run tp @s @p[tag=wander.target]
execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players set sided.goto wander.data 0