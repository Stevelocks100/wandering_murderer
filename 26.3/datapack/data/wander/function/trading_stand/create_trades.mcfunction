data modify storage wander:trades offers set value []
function #wander:add_trades



data modify storage wander:trades temp set from storage wander:trades offers
data modify storage wander:trades offers set value []
function wander:trading_stand/create_trades2
data remove storage wander:trades temp

