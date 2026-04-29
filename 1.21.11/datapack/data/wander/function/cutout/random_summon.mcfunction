summon marker ~ ~ ~ {Tags:["wander.cutout_spawn"]}
spreadplayers ~ ~ 1 40 false @n[tag=wander.cutout_spawn]
execute as @n[tag=wander.cutout_spawn] at @s if entity @p[tag=wander.potential_target,distance=0..10] run kill @s
execute unless entity @n[tag=wander.cutout_spawn] run return run function wander:cutout/random_summon
execute at @n[tag=wander.cutout_spawn] positioned over motion_blocking_no_leaves run function wander:cutout/summon
kill @n[tag=wander.cutout_spawn]