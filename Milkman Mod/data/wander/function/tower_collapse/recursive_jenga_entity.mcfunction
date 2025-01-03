execute if entity @n[tag=wander.jenga_checked,distance=0..0.2] run kill
execute if entity @n[tag=wander.jenga_checked,distance=0..0.2] run return 0

execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_collapse"]}
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_collapse"]}
execute positioned ~ ~1 ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_collapse"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_collapse"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_collapse"]}

tag @s add wander.jenga_checked
tag @s remove wander.tower_collapse

execute if block ~ ~ ~ #wander:immovable run return 0

execute if block ~ ~ ~ #wander:motion_ish run return 0

function wander:tower_collapse/replace

setblock ~ ~ ~ air

