# Generated with MC-Build

execute at @s run tp @s ~ ~1.2 ~
execute positioned over motion_blocking if entity @s[distance=0..10] run function wander:phase3/walls/zzz/17
execute positioned over motion_blocking positioned ~ ~80 ~ if entity @s[distance=0..2] run function wander:phase3/walls/zzz/18