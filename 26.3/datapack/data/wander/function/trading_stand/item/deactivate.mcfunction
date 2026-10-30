execute if entity @s[tag=!wander.trading_stand_item_active] run return 0

execute on passengers if entity @s[type=text_display] run data merge entity @s {start_interpolation:0,transformation:{translation:[0,0.25,0],scale:[0,0,0]}}
tag @s remove wander.trading_stand_item_active
execute on passengers if entity @s[type=interaction] run data modify entity @s response set value 0b