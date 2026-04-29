
execute store result score amount wander.temp run data get entity @s data.stock
execute if score amount wander.temp matches ..0 run return run function wander:trading_stand/item/out_of_stock

execute store result entity @s data.stock int 1 run scoreboard players remove amount wander.temp 1

function wander:trading_stand/item/process_amount2 with entity @s data
return 1