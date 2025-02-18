execute if score do_griefing milk.settings matches -1 run scoreboard players set $strength player_motion.api.launch -8000
execute if score do_griefing milk.settings matches -1 as @a[distance=0..6] at @s rotated as @s rotated ~ 20 run function player_motion:api/launch_looking
playsound entity.zombie.break_wooden_door block @a[distance=0..16] ~ ~-2 ~ 1.0 0.8 0.0

execute if score do_griefing milk.settings matches -1 run return 0

execute summon area_effect_cloud store result score current_y wander.temp run data get entity @s Pos[1]
scoreboard players set desired_y wander.temp -999
execute as @p[tag=wander.target] store result score desired_y wander.temp run data get entity @s Pos[1]
scoreboard players operation desired_y wander.temp -= current_y wander.temp
scoreboard players remove desired_y wander.data 1
execute unless score ai wander.data matches 22..25 run scoreboard players set desired_y wander.temp -99

tag @n[tag=wander.sword_proj_display_landed] add wander.exploded_tower
#execute po
scoreboard players set tower_explosion wander.data 1
execute if score desired_y wander.temp matches ..0 positioned ~ ~-0.5 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-1 positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-2 positioned ~ ~-2 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-3 positioned ~ ~-3 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-4 positioned ~ ~-4 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-5 positioned ~ ~-5 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute if score desired_y wander.temp matches ..-6 positioned ~ ~-6 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace

execute store result score $x player_motion.api.launch run random value -800..800
execute store result score $y player_motion.api.launch run random value -800..800
execute store result score $z player_motion.api.launch run random value -800..800
function player_motion:api/launch_xyz

#execute positioned ~ ~-1 ~ run summon wind_charge ~0.4 ~ ~ {Motion:[0.0d,1.0d,0.0d]}
#execute positioned ~ ~-1 ~ run summon wind_charge ~0.4 ~ ~ {Motion:[0.0d,1.0d,0.0d]}
