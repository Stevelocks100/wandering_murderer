scoreboard players remove @s[scores={wander.rotation_velocity=1..}] wander.rotation_velocity 1
scoreboard players remove @s[scores={wander.rotation_velocity=40..}] wander.rotation_velocity 1

#execute if score @s wander.quaternion matches 0 if score @s wander.rotation_velocity matches 1 run scoreboard players set @s wander.rotation_velocity 0

execute if score @s wander.rotation_velocity matches 85.. if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":7}} run particle trial_spawner_detection ~ ~0.5 ~ 0.1 0 0.1 0 2 normal @a

execute if entity @s[tag=wander.trading_stand_item_active] at @s unless entity @p[distance=0..7] run function wander:trading_stand/item/deactivate

execute if entity @s[tag=wander.trading_stand_item_active] if score item_selected_timer wander.temp matches 1.. run scoreboard players remove item_selected_timer wander.temp 1
execute if entity @s[tag=wander.trading_stand_item_active] if score item_selected_timer wander.temp matches ..0 run function wander:trading_stand/item/deactivate

scoreboard players operation @s wander.quaternion += @s wander.rotation_velocity
scoreboard players set 360 wander.temp 360
scoreboard players operation @s wander.quaternion %= 360 wander.temp
function wander:trading_stand/item/quaternions