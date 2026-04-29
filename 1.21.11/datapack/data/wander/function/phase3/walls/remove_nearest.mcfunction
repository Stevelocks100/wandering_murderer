# Generated with MC-Build

execute unless entity @s[tag=wander.phase3.wall,type=item_display] as @n[tag=wander.phase3.wall,type=item_display,distance=0..] run return run function wander:phase3/walls/remove_nearest
execute on passengers run kill @s
kill @s
execute unless entity @n[tag=wander.phase3.wall,type=item_display,distance=0..] run scoreboard players set walls_enabled wander.phase3.wall_spawn 0