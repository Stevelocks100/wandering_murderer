stopsound @a * wander:wandering_murderer.phase1
stopsound @a * wander:wandering_murderer.phase2
stopsound @a * wander:wandering_murderer.phase3
stopsound @a * wander:wandering_murderer.phase1_slaughterer
stopsound @a * wander:wandering_murderer.slaughterer_intro
stopsound @a * wander:wandering_murderer.phase1_slaughterer
stopsound @a * wander:wandering_murderer.phase2_slaughterer
stopsound @a * wander:wandering_murderer.phase3_slaughterer
stopsound @a * wander:wandering_murderer.phase3_slaughterer_bridge

execute unless score bad_omen wander.data matches 1 run playsound wander:wandering_murderer.ending hostile @s ~ ~ ~ 1.0 1.0 1.0
execute if score bad_omen wander.data matches 1 run playsound wander:wandering_murderer.slaughterer_ending hostile @s ~ ~ ~ 1.0 1.0 1.0

scoreboard players set @s wander.song -1