# Generated with MC-Build

particle gust ~ ~ ~ 0 0 0 0 1 force @a[distance=0..100]
tag @s add wander.phase3.current_entity
execute at @n[tag=wander.phase3.wall_center] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned over motion_blocking facing entity @s feet rotated ~ -4 positioned 0.0 0.0 0.0 positioned ^ ^ ^4 summon marker run function wander:phase3/walls/zzz/22
tag @s remove wander.phase3.current_entity