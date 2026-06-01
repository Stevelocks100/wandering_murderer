execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run attribute @s movement_speed base set 0
execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run function wander:ai/animation_macro {move:'gangnamstyle',idle:'gangnamstyle'}
execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run rotate @s facing entity @p[tag=wander.target] feet





execute unless entity @p[tag=wander.target,distance=0..6] run attribute @s movement_speed base set 1.2
execute unless entity @p[tag=wander.target,distance=0..6] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless entity @p[tag=wander.target,distance=0..6] run function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}