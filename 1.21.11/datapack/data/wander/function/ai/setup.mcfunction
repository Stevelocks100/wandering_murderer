tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0
tp @n[tag=wander.hitbox] @s
ride @s dismount
data modify entity @s Offers.Recipes set value []
data modify entity @n[tag=wander.hitbox] Offers.Recipes set value []

ride @s dismount
ride @n[tag=wander.hitbox] dismount

effect give @s invisibility infinite 200 true
effect give @n[tag=wander.hitbox] invisibility infinite 200 true
item replace entity @s weapon with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @s weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @s weapon.offhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @n[tag=wander.hitbox] weapon with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @n[tag=wander.hitbox] weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @n[tag=wander.hitbox] weapon.offhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]

item replace entity @s armor.head with iron_ingot[enchantments={"wander:armor_piercing":1},equippable={slot:"head",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score hard_mode wander.data matches 1 run item replace entity @s armor.chest with iron_ingot[enchantments={"wander:trader_resistance":1},equippable={slot:"chest",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score hard_mode wander.data matches 1 run item replace entity @s armor.legs with iron_ingot[enchantments={"wander:trader_resistance":1},equippable={slot:"legs",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score hard_mode wander.data matches 1 run item replace entity @s armor.feet with iron_ingot[enchantments={"wander:trader_resistance":1},equippable={slot:"feet",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]

execute if score hard_mode wander.data matches 1 run item replace entity @s armor.chest with iron_ingot[enchantments={"wander:trader_resistance":2},equippable={slot:"chest",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute if score hard_mode wander.data matches 1 run item replace entity @s armor.legs with iron_ingot[enchantments={"wander:trader_resistance":2},equippable={slot:"legs",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute if score hard_mode wander.data matches 1 run item replace entity @s armor.feet with iron_ingot[enchantments={"wander:trader_resistance":2},equippable={slot:"feet",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]

effect clear @n[tag=wander.hitbox] glowing
effect clear @s glowing

scoreboard players set @s wander.motion1 0

execute store result score @s wander.motion2 run data get entity @s Motion[0] 100
execute if score @s wander.motion2 matches ..-1 run scoreboard players operation @s wander.motion2 *= -1 wander.data
scoreboard players operation @s wander.motion1 += @s wander.motion2

execute store result score @s wander.motion2 run data get entity @s Motion[2] 100
execute if score @s wander.motion2 matches ..-1 run scoreboard players operation @s wander.motion2 *= -1 wander.data
scoreboard players operation @s wander.motion1 += @s wander.motion2

execute if score @s wander.motion1 matches 14.. run scoreboard players set @s wander.motion1 1