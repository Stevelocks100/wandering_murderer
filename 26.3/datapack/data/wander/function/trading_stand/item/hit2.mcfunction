data remove entity @s attack

execute at @s run playsound minecraft:entity.glow_item_frame.add_item block @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
execute at @s run playsound minecraft:entity.glow_item_frame.add_item block @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
execute at @s run playsound minecraft:entity.glow_item_frame.add_item block @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0

execute unless predicate wander:is_mounted at @s run ride @s mount @n[type=item_display,distance=0..0.2,tag=wander.trading_stand_item]

execute on vehicle unless score @s wander.rotation_velocity matches 60.. run scoreboard players add @s wander.rotation_velocity 40
execute on vehicle if score @s wander.rotation_velocity matches 60.. run scoreboard players set @s wander.rotation_velocity 100

#execute on vehicle if entity @s[tag=wander.trading_stand_item_active] run return run function wander:trading_stand/item/deactivate
execute on vehicle if entity @s[tag=!wander.trading_stand_item_active] run return run function wander:trading_stand/item/activate