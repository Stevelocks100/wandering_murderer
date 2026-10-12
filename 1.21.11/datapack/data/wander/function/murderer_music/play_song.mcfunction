# Generated with MC-Build

# input:
# id - int
# override - boolean
execute unless function wander:murderer_music/storage/has_storage run function wander:murderer_music/storage/create
$execute if function wander:murderer_music/override_$(override) run function wander:murderer_music/zzz/8
tag @s add wander.music
function wander:murderer_music/storage/reset_stopwatch
$scoreboard players set @s wander.music.current_song $(id)
$execute store result score @s wander.music.max_time run data get storage wander:music song_data[$(id)].duration
$function wander:murderer_music/zzz/11 with storage wander:music song_data[$(id)]
execute if score @s wander.music.current_song matches 8..9 run function wander:murderer_music/disable_music