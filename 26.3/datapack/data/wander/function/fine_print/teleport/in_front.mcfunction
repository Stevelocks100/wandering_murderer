# Generated with MC-Build

scoreboard players set current_pos wander.fine_print -2
execute if score bad_omen wander.data matches 1 if entity @p[tag=wander.target] facing entity @p[tag=wander.target] eyes positioned ^ ^ ^1.9 run return run tp @s ~ ~ ~ ~ 0
execute if score bad_omen wander.data matches 1 unless entity @p[tag=wander.target] facing entity @p eyes positioned ^ ^ ^1.9 run return run tp @s ~ ~ ~ ~ 0
execute if entity @p[tag=wander.target] facing entity @p[tag=wander.target] eyes positioned ^ ^ ^1.4 run return run tp @s ~ ~ ~ ~ 0
execute unless entity @p[tag=wander.target] facing entity @p eyes positioned ^ ^ ^1.4 run return run tp @s ~ ~ ~ ~ 0