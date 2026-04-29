# Generated with MC-Build

execute at @s run tp @s ~ ~0.8 ~
execute positioned over motion_blocking if entity @s[distance=0..10] run function wander:phase3/walls/zzz/14
execute positioned over motion_blocking positioned ~ ~50 ~ if entity @s[distance=0..2] run function wander:phase3/walls/zzz/15