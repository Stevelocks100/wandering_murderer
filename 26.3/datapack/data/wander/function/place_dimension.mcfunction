execute if score spawned wander.data matches 1 run return run schedule function wander:place_dimension 5s

execute in wander:pocket unless loaded -80 64 -80 run return run schedule function wander:place_dimension 5s

execute in wander:pocket if loaded -80 64 -80 run kill @e[type=item_display,tag=wander.trader_dimension.emerald,x=0]
execute in wander:pocket if loaded -80 64 -80 run place template wander:trader_pocket_dimension -80 -64 -80 none
