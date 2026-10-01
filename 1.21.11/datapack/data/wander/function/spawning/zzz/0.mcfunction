# Generated with MC-Build

execute if score trying_to_spawn wander.data matches 1 run return 0
function wander:spawning/select_spawn
execute if score trying_to_spawn wander.data matches 0 run scoreboard players remove timer wander.data 1000
# if can't spawn, don't try to spawn yet.