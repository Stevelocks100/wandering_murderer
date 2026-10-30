# Generated with MC-Build

scoreboard players set #rotation wander.spawn 72
execute summon item_display run function wander:spawning/raycast/zzz/1
execute rotated 0 0 as @n[distance=0..0.1,type=item_display,tag=wander.spawn.spawn_center] run function wander:spawning/raycast/zzz/2