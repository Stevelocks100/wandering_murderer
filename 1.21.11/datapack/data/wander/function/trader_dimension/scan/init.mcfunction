# Generated with MC-Build

execute if score scan_active wander.trader_dimension matches 1 run return 0
scoreboard players set scan_active wander.trader_dimension 1
stopsound @a[distance=0..] ambient
playsound wander:phase3.emerald_stop hostile @a[distance=0..] ~ ~ ~ 20.0 0.7 1.0
playsound wander:phase3.emerald_stop hostile @a[distance=0..] ~ ~ ~ 20.0 0.7 1.0
playsound wander:phase3.emerald_stop hostile @a[distance=0..] ~ ~ ~ 20.0 0.7 1.0
playsound wander:phase3.emerald_stop hostile @a[distance=0..] ~ ~ ~ 20.0 0.7 1.0
# function wander:fine_print/set_teleport_duration {duration:50}
function wander:trader_dimension/lights/off
scoreboard players set scan_timer wander.trader_dimension 219
schedule function wander:trader_dimension/scan/1 3s replace