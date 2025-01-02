execute if block ~ ~ ~ #wander:immovable run return 0
execute if block ~ ~ ~ #wander:air_ish run return 0

function wander:tower_collapse/replace
execute positioned ~ ~1 ~ run function wander:tower_collapse/recursive_jenga