execute if score current_phase wander.song matches 1 run scoreboard players set @s wander.song 548
execute if score current_phase wander.song matches 2 run scoreboard players set @s wander.song 548
execute if score current_phase wander.song matches 3 run scoreboard players set @s wander.song 411
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 1 run scoreboard players set @s wander.song 548
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 2 run scoreboard players set @s wander.song 549
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 3 run scoreboard players set @s wander.song 583

stopsound @s * wander:wandering_murderer.slaughterer_intro
stopsound @s * wander:wandering_murderer.slaughterer_ending

stopsound @s * wander:wandering_murderer.phase1
stopsound @s * wander:wandering_murderer.phase2
stopsound @s * wander:wandering_murderer.phase3
stopsound @s * wander:wandering_murderer.phase1_slaughterer
stopsound @s * wander:wandering_murderer.phase2_slaughterer
stopsound @s * wander:wandering_murderer.phase3_slaughterer
stopsound @a * wander:wandering_murderer.phase3_slaughterer_bridge
execute unless score bad_omen wander.data matches 1 if score current_phase wander.song matches 1 run playsound wander:wandering_murderer.phase1 hostile @s ~ ~ ~ 1.0 1.0 1.0
execute unless score bad_omen wander.data matches 1 if score current_phase wander.song matches 2 run playsound wander:wandering_murderer.phase2 hostile @s ~ ~ ~ 1.0 1.0 1.0
execute unless score bad_omen wander.data matches 1 if score current_phase wander.song matches 3 run playsound wander:wandering_murderer.phase3 hostile @s ~ ~ ~ 1.0 1.0 1.0
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 1 run playsound wander:wandering_murderer.phase1_slaughterer hostile @s ~ ~ ~ 1.0 1.0 1.0
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 2 run playsound wander:wandering_murderer.phase2_slaughterer hostile @s ~ ~ ~ 1.0 1.0 1.0
execute if score bad_omen wander.data matches 1 if score current_phase wander.song matches 3 run playsound wander:wandering_murderer.phase3_slaughterer hostile @s ~ ~ ~ 1.0 1.0 1.0

