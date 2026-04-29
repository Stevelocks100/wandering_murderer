data remove entity @s interaction
execute on vehicle unless entity @s[tag=wander.trading_stand_item_active] run return 0
execute on vehicle run function wander:trading_stand/item/interact3 with entity @s data