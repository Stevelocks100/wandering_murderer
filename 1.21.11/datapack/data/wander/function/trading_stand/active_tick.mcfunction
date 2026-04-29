execute if predicate wander:daytime if entity @s[tag=wander.sleeping] as @n[tag=aj.wander.root] run function animated_java:wander/animations/sit_wake/play
execute if predicate wander:daytime if entity @s[tag=wander.sleeping] as @e[tag=wander.trading_stand_item,distance=0..5] run function wander:trading_stand/item/day
execute if predicate wander:daytime if entity @s[tag=wander.sleeping] run tag @s remove wander.sleeping

execute if predicate wander:nighttime if entity @s[tag=!wander.sleeping] as @n[tag=aj.wander.root] run function animated_java:wander/animations/sit_sleep/play
execute if predicate wander:nighttime if entity @s[tag=!wander.sleeping] as @e[tag=wander.trading_stand_item,distance=0..5] run function wander:trading_stand/item/night

execute if predicate wander:nighttime if entity @s[tag=!wander.sleeping] run tag @s add wander.sleeping

execute if predicate wander:daytime if score trading_duration wander.data matches -9..1 if entity @p[distance=0..30] run scoreboard players remove trading_duration wander.data 1
execute if predicate wander:daytime if score trading_duration wander.data matches ..-10 run scoreboard players remove trading_duration wander.data 1
execute as @e[tag=wander.trading_stand_item,tag=wander.out_of_stock,distance=0..7,type=item_display] run scoreboard players remove trading_duration wander.data 50

execute if score trading_duration wander.data matches ..-100000 run function wander:trading_stand/leave
execute if score daytime wander.data matches -499.. run function wander:trading_stand/leave
execute unless entity @p[distance=0..40] run return 0
# item stuff below
execute as @e[tag=wander.trading_stand_item,distance=0..5,type=item_display] at @s run function wander:trading_stand/item/tick

execute as @e[type=item,distance=0..10] if data entity @s Item.components."minecraft:custom_data".mystery at @s run function wander:trading_stand/mystery_box
