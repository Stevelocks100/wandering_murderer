# Generated with MC-Build

execute if entity @n[tag=aj.wander.root,distance=0..150] if score ai wander.data matches 20..30 unless score ai wander.data matches 29 run tag @s add wander.music
scoreboard players operation @s wander.music.current_song = $(music_index) wander.music
function wander:murderer_music/storage/create