# Generated with MC-Build

execute at @s run tp @s ~ ~0.4 ~
execute positioned over motion_blocking if entity @s[distance=0..10] run function wander:phase3/walls/zzz/11
execute positioned over motion_blocking positioned ~ ~20 ~ if entity @s[distance=0..2] run function wander:phase3/walls/zzz/12