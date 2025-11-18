scoreboard players remove @s wander.song 1

execute if score @s wander.song matches ..0 unless score current_phase wander.song matches 4 run function murderer_music:restart_song

