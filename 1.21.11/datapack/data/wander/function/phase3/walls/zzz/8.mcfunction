# Generated with MC-Build

tag @s remove theworld.frozen
execute if entity @s[tag=wander.phase3.wall_bounce] run function wander:phase3/walls/zzz/9
execute if entity @s[tag=wander.phase3.wall_spawning] run return run function wander:phase3/walls/zzz/10
execute if entity @s[tag=wander.phase3.wall_spawning2] run return run function wander:phase3/walls/zzz/13
execute if entity @s[tag=wander.phase3.wall_spawning3] run return run function wander:phase3/walls/zzz/16
execute if entity @n[tag=wander.phase3.wall_spawning] run return 0
execute unless entity @s[tag=wander.phase3.wall2] at @n[tag=wander.phase3.wall_center] rotated as @s rotated ~1 ~ positioned ^ ^ ^-40 positioned over motion_blocking run tp @s ~ ~20 ~ ~ 0
execute if entity @s[tag=wander.phase3.wall2] at @n[tag=wander.phase3.wall_center] rotated as @s rotated ~-3 ~ positioned ^ ^ ^-40 positioned over motion_blocking run tp @s ~ ~50 ~ ~ 0
execute if entity @s[tag=wander.phase3.wall3] at @n[tag=wander.phase3.wall_center] rotated as @s rotated ~5 ~ positioned ^ ^ ^-40 positioned over motion_blocking run tp @s ~ ~80 ~ ~ 0
execute if entity @s[tag=!wander.phase3.wall2,tag=!wander.phase3.wall3] if predicate {"condition":"minecraft:random_chance","chance":0.005} run playsound wander:phase3.emerald_hum hostile @a[distance=0..100] ~ ~ ~ 2.0 1.0 0.1
execute if predicate {"condition":"minecraft:random_chance","chance":0.002} run function wander:phase3/walls/random_gunpowder
execute if score gunpowder_count wander.data matches 200.. if predicate {"condition":"minecraft:random_chance","chance":0.0025} as @n[tag=wander.gunpowder,distance=0..40] if data entity @s {OnGround:1b} at @s run function wander:gunpowder/explode
scoreboard players remove @s[scores={wander.phase3.launched=1..}] wander.phase3.launched 1