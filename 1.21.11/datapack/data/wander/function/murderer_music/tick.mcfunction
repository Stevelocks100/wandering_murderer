# Generated with MC-Build

function wander:murderer_music/tps_counter/tick
execute if score health wander.data > 66%health wander.data run scoreboard players set current_phase wander.music 1
execute if score health wander.data <= 66%health wander.data if score health wander.data > 33%health wander.data run scoreboard players set current_phase wander.music 2
execute if score health wander.data <= 33%health wander.data run scoreboard players set current_phase wander.music 3
execute if score 33%health wander.data matches -1 run scoreboard players set current_phase wander.music 3
execute if score ai wander.data matches 30..32 run scoreboard players set current_phase wander.music 1
execute if score ai wander.data matches -2 run scoreboard players set current_phase wander.music 4
execute if score do_music milk.settings matches -1 run return 0
execute if score current_phase wander.music matches 1 run scoreboard players set $music_index wander.music 0
execute if score current_phase wander.music matches 2 run scoreboard players set $music_index wander.music 1
execute if score current_phase wander.music matches 3 run scoreboard players set $music_index wander.music 2
execute if score current_phase wander.music matches 1 if score bad_omen wander.data matches 1 run scoreboard players set $music_index wander.music 3
execute if score current_phase wander.music matches 2 if score bad_omen wander.data matches 1 run scoreboard players set $music_index wander.music 4
execute if score current_phase wander.music matches 3 if score bad_omen wander.data matches 1 run scoreboard players set $music_index wander.music 5
execute if score spawned wander.data matches 0 run scoreboard players set $music_index wander.music -1
execute if score ai wander.data matches -2 run scoreboard players set $music_index wander.music -1
# $music_index <%prefix%> 7 is bridge, 6 is intro
function wander:murderer_music/zzz/0
function wander:murderer_music/storage/cycle
execute if score spawned wander.data matches 1 as @a[x=0,tag=!wander.music] at @s rotated as @s run function wander:murderer_music/zzz/1
execute if score ai wander.data matches -2 as @a[x=0,tag=wander.music,scores={wander.music.current_song=0..}] at @s run function wander:murderer_music/ending
execute if score ai wander.data matches 31 as @a[x=0,tag=wander.music,scores={wander.music.current_song=0..}] at @s run function wander:murderer_music/ending
execute if score ai wander.data matches 33 as @a[x=0,tag=wander.music,scores={wander.music.current_song=0..}] at @s run function wander:murderer_music/ending
execute as @a[tag=!wander.music] run scoreboard players set @s wander.music.current_song -1
execute as @a[tag=!wander.music] run scoreboard players set @s wander.music.max_time -1
execute as @a[tag=wander.music] at @s run function wander:murderer_music/as_player
execute if score daytime wander.data matches -501 if score spawned wander.data matches 0 as @a[tag=wander.music] run function wander:murderer_music/zzz/3
execute if score spawned wander.data matches 0 as @a[tag=wander.music] run function wander:murderer_music/disable_music