# Generated with MC-Build

execute at @n[tag=wander.phase3.wall_center] unless loaded ~-40 60 ~-40 run return 0
execute at @n[tag=wander.phase3.wall_center] unless loaded ~40 60 ~-40 run return 0
execute at @n[tag=wander.phase3.wall_center] unless loaded ~40 60 ~40 run return 0
execute at @n[tag=wander.phase3.wall_center] unless loaded ~-40 60 ~40 run return 0
execute unless entity @n[tag=wander.phase3.wall_center] run return 0
execute as @e[tag=wander.phase3.spawned_effect] at @s run function wander:phase3/walls/zzz/7
execute as @e[tag=wander.phase3.wall] at @s rotated as @s run function wander:phase3/walls/zzz/8
execute at @n[tag=wander.phase3.wall_center] run scoreboard players remove @e[distance=0..100,scores={wander.phase3.launched=1..}] wander.phase3.launched 1
execute at @n[tag=wander.phase3.wall_center] as @a[distance=30..200] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned over motion_blocking run function wander:phase3/walls/zzz/19
execute at @n[tag=wander.phase3.wall_center] as @e[type=!#milk:command_entities,distance=30..250,tag=!wander.gunpowder,type=!#wander:wall_cannot_push] at @s run function wander:phase3/walls/launch_back