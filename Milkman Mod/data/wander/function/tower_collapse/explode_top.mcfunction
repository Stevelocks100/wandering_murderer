
playsound entity.zombie.break_wooden_door block @a[distance=0..32] ~ ~-2 ~ 2.0 0.8 0.0
tag @n[tag=wander.sword_proj_display_landed] add wander.exploded_tower
#execute po
scoreboard players set tower_explosion wander.data 1
execute positioned ~ ~-0.5 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-2 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-3 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-4 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-5 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace
execute positioned ~ ~-6 ~ unless block ~ ~ ~ #wander:immovable unless block ~ ~ ~ #wander:air_ish run function wander:tower_collapse/replace

execute store result score $x player_motion.api.launch run random value -800..800
execute store result score $y player_motion.api.launch run random value -800..800
execute store result score $z player_motion.api.launch run random value -800..800
function player_motion:api/launch_xyz

#execute positioned ~ ~-1 ~ run summon wind_charge ~0.4 ~ ~ {Motion:[0.0d,1.0d,0.0d]}
#execute positioned ~ ~-1 ~ run summon wind_charge ~0.4 ~ ~ {Motion:[0.0d,1.0d,0.0d]}
