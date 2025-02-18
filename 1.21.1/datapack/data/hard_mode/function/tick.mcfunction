execute if score hard_mode wander.data matches 1 run function hard_mode:tick_active

execute as @e[type=wandering_trader,tag=!wander,tag=!wander.whey_checked] run function hard_mode:add_whey

execute as @e[type=wandering_trader,tag=!wander,tag=!wander.disc_checked] run function hard_mode:add_disc