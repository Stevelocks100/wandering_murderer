# Generated with MC-Build

# hide text, display timer.
execute in wander:pocket run function wander:trader_dimension/scan/zzz/0
execute if score scan_timer wander.trader_dimension matches 1.. run return run schedule function wander:trader_dimension/scan/1 1t replace
schedule function wander:trader_dimension/scan/2 1s replace