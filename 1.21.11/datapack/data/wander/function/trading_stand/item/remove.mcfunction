execute unless entity @s[tag=wander.trading_stand_item] as @n[tag=wander.trading_stand_item,distance=0..8] run return run function wander:trading_stand/item/remove
execute on passengers run kill
kill