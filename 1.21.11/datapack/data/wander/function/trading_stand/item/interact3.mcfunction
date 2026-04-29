
$execute store result score item_count wander.temp run clear @p[tag=wander.current_player] $(id) 0
$execute unless score item_count wander.temp matches $(amount).. run return run function wander:trading_stand/item/deny
scoreboard players set amount wander.temp 99
execute if data entity @s data{item_limit:"true"} unless function wander:trading_stand/item/process_amount run return run function wander:trading_stand/item/deny
execute if data entity @s data{global_limit:"true"} if data entity @s data{item_limit:"true"} run function wander:trading_stand/item/update_global_amount with entity @s data
$execute if score item_count wander.temp matches $(amount).. run clear @p[tag=wander.current_player] $(id) $(amount)
$execute if score item_count wander.temp matches $(amount).. run return run function wander:trading_stand/item/trade
function wander:trading_stand/item/deny