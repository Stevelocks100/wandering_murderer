# Generated with MC-Build

kill @e[tag=wander.phase3.spawned_effect]
execute at @n[tag=wander.phase3.wall_center] as @n[tag=wander.phase3.wall,limit=10] at @s rotated as @s run function wander:phase3/walls/zzz/27
execute at @n[tag=wander.phase3.wall_center] as @n[tag=wander.phase3.wall,limit=20] at @s rotated as @s run function wander:phase3/walls/zzz/28
execute as @e[tag=wander.phase3.wall] at @s rotated as @s run function wander:phase3/walls/split
function wander:phase3/walls/remove_all