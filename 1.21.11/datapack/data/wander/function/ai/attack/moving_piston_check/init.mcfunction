return run clone ~-4 ~-2 ~-4 ~4 ~2 ~4 ~-4 ~-2 ~-4 filtered moving_piston force
# scoreboard players set moving_piston wander.data 0
# function wander:ai/attack/moving_piston_check/x
# return run scoreboard players get moving_piston wander.data