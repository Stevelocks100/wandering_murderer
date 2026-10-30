function wander:select_kill_credit
execute as @p[tag=wander.kill_credit] run tag @s add wander.target
execute unless entity @p[tag=wander.kill_credit] run tag @r[tag=wander.potential_target] add wander.target
execute as @p[tag=wander.kill_credit] run tag @s remove wander.kill_credit
execute as @p[tag=wander.target] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^-20 positioned over motion_blocking_no_leaves run function wander:existence/summon_30
