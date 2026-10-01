# Generated with MC-Build

execute if entity @s[distance=0..4] run return 0
execute unless block ~ ~ ~ #wander:can_pass run return run function wander:spawning/raycast/hit
execute positioned ^ ^ ^0.5 run function wander:spawning/raycast/zzz/3