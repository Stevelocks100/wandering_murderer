# Generated with MC-Build

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"location":{"position":{"y":{"max":-70}}}}} run function wander:trader_dimension/zzz/6
attribute @s minecraft:block_interaction_range modifier add wander:pocket -10 add_multiplied_total
# execute if predicate {"condition":"minecraft:all_of","terms":[{"condition":"minecraft:random_chance","chance":0.3},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":500}}]} run playsound wander:pocket.ambience hostile @s ~ ~ ~ 0.8 1.0 1.0
scoreboard players remove @s[scores={wander.trader_dimension.freedom_timer=1..}] wander.trader_dimension.freedom_timer 1
execute if score @s wander.trader_dimension.freedom_timer matches 40 run title @s[tag=!wander.debug] times 30 10 10
execute if score @s wander.trader_dimension.freedom_timer matches 40 run title @s[tag=!wander.debug] title {text:"\uFF00",font:"wander:default",color:"white"}
execute if score @s wander.trader_dimension.freedom_timer matches 1 run function wander:trader_dimension/leave