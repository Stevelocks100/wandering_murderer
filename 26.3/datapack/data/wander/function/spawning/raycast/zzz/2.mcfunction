# Generated with MC-Build

function wander:spawning/raycast/find_blocked
scoreboard players remove #rotation wander.spawn 1
execute if score #rotation wander.spawn matches 1.. rotated ~5 0 run function wander:spawning/raycast/zzz/2
kill @s