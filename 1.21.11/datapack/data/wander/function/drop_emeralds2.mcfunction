scoreboard players remove emeralds wander.temp 1

execute store result storage wander:temp motion.x float 0.025 run random value -12..-6
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} store result storage wander:temp motion.x float 0.1 run random value 6..12

execute store result storage wander:temp motion.y float 0.025 run random value 6..12

execute store result storage wander:temp motion.z float 0.025 run random value -12..-6
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} store result storage wander:temp motion.z float 0.1 run random value 6..12

function wander:drop_emeralds3 with storage wander:temp motion

execute if score emeralds wander.temp matches 1.. run function wander:drop_emeralds2