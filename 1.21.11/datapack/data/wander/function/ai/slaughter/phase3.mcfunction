function wander:phase3/walls/summon_all

execute as @a[tag=wander.in_dimension] at @s rotated as @s run function wander:trader_dimension/leave

scoreboard players set 33%health wander.data -1
scoreboard players set 66%health wander.data -1

scoreboard players set start_phase3 wander.data 1

bossbar set wander:health max 600
scoreboard players set health wander.data 600

scoreboard players set current_phase wander.song 3

#execute as @a[distance=0..100] run function wander:murderer_music/restart_song

function wander:ai/slaughter/vanish

advancement grant @a[distance=0..80] only wander:story/one_attempt

execute as @a[scores={wander.song=0..}] at @s run function wander:murderer_music/phase3_bridge

#function wander:fine_print/remove