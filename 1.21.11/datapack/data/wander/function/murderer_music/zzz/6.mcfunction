# Generated with MC-Build

execute unless function wander:murderer_music/continue_music run return run function wander:murderer_music/disable_music
data modify storage wander:music song.override set value false
execute store result storage wander:music song.index int 1 run scoreboard players get @s wander.music.current_song
execute if score @s wander.music.current_song matches 1..3 run data modify storage wander:music song.override set value true
execute unless score $music_index wander.music matches -1 run return run function wander:murderer_music/zzz/7
scoreboard players set @s wander.music.current_song -1