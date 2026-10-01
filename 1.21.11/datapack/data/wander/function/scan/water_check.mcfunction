execute store result score water_check wander.temp run function wander:scan/water_check1
execute unless score water_check wander.temp matches 0 run return run scoreboard players get water_check wander.temp
execute store result score water_check wander.temp run function wander:scan/water_check2
execute unless score water_check wander.temp matches 0 run return run scoreboard players get water_check wander.temp
