# The area scanned are set by the scores:
#  .x_size scan_config
#  .y_size scan_config
#  .z_size scan_config
scoreboard players set water_check wander.temp 0
execute if entity @s[tag=wander.ai] store result score water_check wander.temp run return run function wander:scan/water_check
function wander:scan/raycasts/start_ray_x