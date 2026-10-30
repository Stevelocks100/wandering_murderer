# Generated with MC-Build

execute unless block ~ ~ ~ jukebox[has_record=true]{RecordItem:{components:{"minecraft:jukebox_playable":"wander:amethyst_altercation"}}} run return 0
execute if entity @n[tag=wander.jukebox_animation.jukebox,type=marker,distance=0..0.2] run return 0
scoreboard players set found_jukebox wander.jukebox_animation 1
execute summon marker run function wander:jukebox_animation/jukebox_scan/zzz/0