function wander:trading_stand/create_trade_items5 with storage wander:temp macro
function wander:trading_stand/create_trade_items6 with storage wander:temp macro
function wander:trading_stand/create_trade_items7 with storage wander:temp macro

scoreboard players remove max_checks wander.temp 1
execute if score max_checks wander.temp matches ..0 run return 0
execute unless data storage wander:trades main_offers[2] run function wander:trading_stand/create_trade_items4