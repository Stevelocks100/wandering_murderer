advancement revoke @s only wander:booth_item_interact

tag @s add wander.current_player
execute as @e[type=interaction,distance=0..5] at @s if data entity @s interaction run function wander:trading_stand/item/interact2
tag @s remove wander.current_player