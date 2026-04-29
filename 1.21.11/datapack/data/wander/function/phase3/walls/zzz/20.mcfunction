# Generated with MC-Build

particle gust ~ ~ ~ 0 0 0 0 1 force @a[distance=0..100]
scoreboard players set $strength player_motion.api.launch -18000
execute at @n[tag=wander.phase3.wall_center] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned over motion_blocking rotated ~ 30 run function player_motion:api/launch_looking
scoreboard players set @s wander.launch_cd 5