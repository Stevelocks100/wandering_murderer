# Generated with MC-Build

function wander:spawning/raycast/init
# [tag=wander.potential_spawn,x=0,type=item_display]
# next, trim down the spawn points for the perfect™ distance.
# if within 10 blocks or outside 40 blocks, remove.
# if there's entities within 23 to 28 blocks, remove everything outside that.
# for spawn search method 1, choose random from here.
# for spawn search method 2, do none of this, and simply choose the nearest that's further than 8 blocks away.
execute if score spawn_search_method wander.data matches 1 run function wander:spawning/zzz/3
execute if score spawn_search_method wander.data matches 2 as @n[tag=wander.potential_spawn,distance=8..] run tag @s add wander.spawn_pos
tag @n[tag=wander.spawn_pos,x=0,type=item_display] remove wander.potential_spawn
kill @e[tag=wander.potential_spawn,x=0,type=item_display]