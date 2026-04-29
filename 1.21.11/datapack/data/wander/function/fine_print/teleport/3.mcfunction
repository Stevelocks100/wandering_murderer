# Generated with MC-Build

execute unless score current_pos wander.fine_print = desired_pos wander.fine_print positioned ^ ^1 ^1 run summon marker ~ ~ ~ {Tags:["wander.fine_print.stand_location"]}
execute at @n[tag=wander.fine_print.stand_location,distance=0..,type=marker] if entity @s[distance=0..0.4] run scoreboard players set current_pos wander.fine_print 3
execute unless score current_pos wander.fine_print = desired_pos wander.fine_print at @s facing entity @n[tag=wander.fine_print.stand_location,distance=0..,type=marker] feet positioned ^ ^ ^0.35 run return run tp @s ~ ~ ~
tp @s ^ ^1 ^1 ~ 0