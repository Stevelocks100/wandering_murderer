execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run attribute @s movement_speed base set 0
execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run function wander:ai/anim_states/gangnam
execute if data entity @s {OnGround:1b} if entity @p[tag=wander.target,distance=0..4] run rotate @s facing entity @p[tag=wander.target] feet





execute unless entity @p[tag=wander.target,distance=0..6] run attribute @s movement_speed base set 1.2
execute unless entity @p[tag=wander.target,distance=0..6] run function wander:ai/anim_states/angry_no_sword
execute unless entity @p[tag=wander.target,distance=0..6] run function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}