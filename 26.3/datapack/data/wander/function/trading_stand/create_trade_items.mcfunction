execute store result score list_length wander.temp run data get storage wander:trades offers
data modify storage wander:trades main_offers set value []
data modify storage wander:trades weighted_offers set from storage wander:trades offers

function wander:trading_stand/create_trade_items2


execute store result score list_length wander.temp run data get storage wander:trades weighted_offers
scoreboard players remove list_length wander.temp 1
execute store result storage wander:temp macro.list_length int 1 run scoreboard players get list_length wander.temp

scoreboard players set max_checks wander.temp 30
function wander:trading_stand/create_trade_items4
