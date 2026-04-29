data modify storage wander:trades weighted_offers append from storage wander:trades weighted_offers[0]


scoreboard players remove weight wander.temp 1
execute if score weight wander.temp matches 1.. run function wander:trading_stand/create_trade_items3