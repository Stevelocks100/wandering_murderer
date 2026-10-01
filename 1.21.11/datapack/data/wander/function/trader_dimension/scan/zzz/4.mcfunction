# Generated with MC-Build

# checking
execute as @n[tag=aj.fine_print.root,x=0] at @s run function wander:trader_dimension/scan/light_raycast
execute as @a[tag=wander.trader_dimension.scan_target] at @s if predicate {"condition":"minecraft:location_check","predicate":{"can_see_sky":true}} run function wander:trader_dimension/scan/caught
scoreboard players remove check_timer wander.trader_dimension 1
execute if score check_timer wander.trader_dimension matches 1.. run return run schedule function wander:trader_dimension/scan/4 1t replace
# checking done
execute as @n[tag=aj.fine_print.root,x=0] at @s run function wander:trader_dimension/scan/remove_light
tag @a[tag=wander.trader_dimension.scan_target] remove wander.trader_dimension.scan_target
# find a new player
execute if entity @p[tag=wander.trader_dimension.must_check,x=0] run return run schedule function wander:trader_dimension/scan/3 1s replace
# no players left to check
schedule function wander:trader_dimension/scan/end 1s replace