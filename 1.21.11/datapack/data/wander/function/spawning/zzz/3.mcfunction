# Generated with MC-Build

kill @e[tag=wander.potential_spawn,type=item_display,distance=..10]
kill @e[tag=wander.potential_spawn,type=item_display,distance=40..]
execute if entity @n[tag=wander.potential_spawn,type=item_display,distance=23..28] run function wander:spawning/zzz/4
execute as @n[tag=wander.potential_spawn,sort=random,x=0,type=item_display] run tag @s add wander.spawn_pos