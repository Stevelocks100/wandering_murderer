# Generated with MC-Build

execute if score @s wander.phase3.launched matches 1.. run return 0
scoreboard players set @s wander.phase3.launched 20
scoreboard players set @s[type=player] wander.phase3.launched 5
execute as @n[tag=wander.phase3.wall] at @s run function wander:phase3/walls/zzz/25