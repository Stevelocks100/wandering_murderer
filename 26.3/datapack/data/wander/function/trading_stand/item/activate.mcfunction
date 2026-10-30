execute as @n[tag=wander.trading_stand_item_active,distance=0.1..10] at @s run function wander:trading_stand/item/deactivate
scoreboard players set item_selected_timer wander.temp 300
execute if entity @s[tag=wander.trading_stand_item_active] run return 0
execute on passengers if entity @s[type=text_display] run data merge entity @s {start_interpolation:0,transformation:{translation:[0,0.75,0],scale:[0.8,0.8,0.8]}}
tag @s add wander.trading_stand_item_active
execute on passengers if entity @s[type=interaction] run data modify entity @s response set value 1b
