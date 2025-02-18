execute if score current_phase wander.song matches 1 run scoreboard players set @s wander.song 548
execute if score current_phase wander.song matches 2 run scoreboard players set @s wander.song 548
execute if score current_phase wander.song matches 3 run scoreboard players set @s wander.song 411
stopsound @s music
execute if score current_phase wander.song matches 1 run playsound wander:wandering_murderer.phase1 hostile @s ~ ~ ~ 1000.0 1.0 1.0
execute if score current_phase wander.song matches 2 run playsound wander:wandering_murderer.phase2 hostile @s ~ ~ ~ 1000.0 1.0 1.0
execute if score current_phase wander.song matches 3 run playsound wander:wandering_murderer.phase3 hostile @s ~ ~ ~ 1000.0 1.0 1.0

