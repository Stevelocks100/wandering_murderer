# Generated with MC-Build

kill @e[tag=wander.phase3.spawned_effect,type=item_display,x=0]
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] as @n[tag=wander.phase3.wall,limit=10,type=item_display,x=0] at @s rotated as @s run function wander:phase3/walls/zzz/28
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] as @n[tag=wander.phase3.wall,limit=20,type=item_display,x=0] at @s rotated as @s run function wander:phase3/walls/zzz/29
execute as @e[tag=wander.phase3.wall,type=item_display,x=0] at @s rotated as @s run function wander:phase3/walls/split
function wander:phase3/walls/remove_all