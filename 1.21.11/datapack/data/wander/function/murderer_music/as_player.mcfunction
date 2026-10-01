# Generated with MC-Build

execute unless function wander:murderer_music/storage/has_storage run function wander:murderer_music/storage/create
execute if score @s wander.music.current_song matches -1 run return 0
execute unless dimension overworld run return run function wander:murderer_music/zzz/4
function milk:gu/generate
function wander:murderer_music/zzz/5 with storage milk:gu_main
execute if score tps wander.music.tps matches ..18 run scoreboard players remove @s wander.music.max_time 1
execute if score @s wander.music.time >= @s wander.music.max_time run function wander:murderer_music/zzz/6
execute if score tps wander.music.tps matches ..18 run scoreboard players add @s wander.music.max_time 1