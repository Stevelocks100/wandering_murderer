# Generated with MC-Build

# spawn search method:
# 1 = actually trying to spawn, so make it far-ish away.
# 2 = already exists, so sneaking up on players
scoreboard players set trying_to_spawn wander.data 0
# choose a target
function wander:spawning/find_target
# make sure select spawn cannot run again, UNLESS no spawn has appeared
execute as @p[tag=wander.target,x=0] at @s rotated as @s run function wander:spawning/find_positions
execute if entity @n[tag=wander.spawn_pos,x=0,type=item_display] run function wander:spawning/zzz/2