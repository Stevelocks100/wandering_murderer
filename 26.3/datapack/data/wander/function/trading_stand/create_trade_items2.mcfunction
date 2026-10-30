execute store result score weight wander.temp run data get storage wander:trades weighted_offers[0].weight
execute if score weight wander.temp matches -1 unless data storage wander:trades main_offers[2] run data modify storage wander:trades main_offers append from storage wander:trades weighted_offers[0]
execute if score weight wander.temp matches 1.. run function wander:trading_stand/create_trade_items3

data remove storage wander:trades weighted_offers[0]
scoreboard players remove list_length wander.temp 1
execute if score list_length wander.temp matches 1.. run function wander:trading_stand/create_trade_items2