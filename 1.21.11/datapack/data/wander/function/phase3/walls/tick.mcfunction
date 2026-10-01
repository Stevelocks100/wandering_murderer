# Generated with MC-Build

execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] unless loaded ~-40 60 ~-40 run return 0
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] unless loaded ~40 60 ~-40 run return 0
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] unless loaded ~40 60 ~40 run return 0
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] unless loaded ~-40 60 ~40 run return 0
execute unless entity @n[tag=wander.phase3.wall_center,type=marker,x=0] run return 0
execute as @e[tag=wander.phase3.spawned_effect,type=item_display,x=0] at @s run function wander:phase3/walls/zzz/8
execute as @e[tag=wander.phase3.wall,type=item_display,x=0] at @s rotated as @s run function wander:phase3/walls/zzz/9
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] run scoreboard players remove @e[distance=0..100,scores={wander.phase3.launched=1..}] wander.phase3.launched 1
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] as @a[distance=30..200] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned over motion_blocking run function wander:phase3/walls/zzz/20
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] as @e[type=!#milk:command_entities,distance=30..100,tag=!wander.entity,type=!#wander:wall_cannot_push] at @s run function wander:phase3/walls/launch_back
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] as @a[distance=30..250,tag=wander.potential_target] at @s run function wander:phase3/walls/launch_back