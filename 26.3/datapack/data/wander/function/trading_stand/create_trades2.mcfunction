execute unless data storage wander:trades temp[0] run return 0

data modify storage wander:trades temp_offer.offer set from storage wander:trades temp[0]
function wander:trading_stand/item/parse_item_data with storage wander:trades temp_offer
data modify storage wander:trades offers append from storage wander:trades trading_stand.item


data remove storage wander:trades temp[0]
function wander:trading_stand/create_trades2