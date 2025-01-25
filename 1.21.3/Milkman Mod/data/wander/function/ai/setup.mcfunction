tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0
tp @n[tag=wander.hitbox] @s
ride @s dismount
data modify entity @s Offers.Recipes set value []
data modify entity @n[tag=wander.hitbox] Offers.Recipes set value []

ride @s dismount
ride @n[tag=wander.hitbox] dismount

effect give @s invisibility infinite 200 true
effect give @n[tag=wander.hitbox] invisibility infinite 200 true
item replace entity @s weapon with milk_bucket[item_model="wander:empty"]
item replace entity @s weapon.mainhand with milk_bucket[item_model="wander:empty"]
item replace entity @s weapon.offhand with milk_bucket[item_model="wander:empty"]
item replace entity @n[tag=wander.hitbox] weapon with milk_bucket[item_model="wander:empty"]
item replace entity @n[tag=wander.hitbox] weapon.mainhand with milk_bucket[item_model="wander:empty"]
item replace entity @n[tag=wander.hitbox] weapon.offhand with milk_bucket[item_model="wander:empty"]

scoreboard players set @s wander.motion1 0

execute store result score @s wander.motion2 run data get entity @s Motion[0] 100
execute if score @s wander.motion2 matches ..-1 run scoreboard players operation @s wander.motion2 *= -1 wander.data
scoreboard players operation @s wander.motion1 += @s wander.motion2

execute store result score @s wander.motion2 run data get entity @s Motion[2] 100
execute if score @s wander.motion2 matches ..-1 run scoreboard players operation @s wander.motion2 *= -1 wander.data
scoreboard players operation @s wander.motion1 += @s wander.motion2

execute if score @s wander.motion1 matches 14.. run scoreboard players set @s wander.motion1 1