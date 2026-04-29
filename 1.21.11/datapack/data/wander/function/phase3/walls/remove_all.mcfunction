# Generated with MC-Build

execute as @e[tag=wander.phase3.wall,type=item_display,distance=0..] run function wander:phase3/walls/zzz/6
kill @n[tag=wander.phase3.wall_center]
scoreboard players set walls_enabled wander.phase3.wall_spawn 0