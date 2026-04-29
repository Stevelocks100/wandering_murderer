scoreboard players remove @s wander.song 1

execute unless score ai wander.data matches 29.. if score @s wander.song matches -2 if score bad_omen wander.data matches 1 if score current_phase wander.song matches 1 run return run function wander:murderer_music/slaughterer_intro
execute if score @s wander.song matches ..0 unless score current_phase wander.song matches 4 run function wander:murderer_music/restart_song

