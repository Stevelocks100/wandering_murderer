tp @n[tag=aj.wander.root,type=item_display] ~ ~ ~ ~ 0
tp 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f @s
ride @s dismount
data modify entity @s Offers.Recipes set value []
data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Offers.Recipes set value []

data merge entity @s {drop_chances:{head:0,chest:0,feet:0,legs:0,mainhand:0,offhand:0}}
data merge entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f {drop_chances:{head:0,chest:0,feet:0,legs:0,mainhand:0,offhand:0}}

effect give @s resistance infinite 20 true
effect give @s regeneration infinite 200 true
attribute @s max_health base set 1024

ride @s dismount
ride 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f dismount

effect give @s invisibility infinite 200 true
effect give 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f invisibility infinite 200 true

item replace entity @s weapon with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @s weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity @s weapon.offhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]

item replace entity @s[tag=wander.break_shield] weapon with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}},weapon={disable_blocking_for_seconds:5}]
item replace entity @s[tag=wander.break_shield] weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}},weapon={disable_blocking_for_seconds:5}]
item replace entity @s[tag=wander.break_shield] weapon.offhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}},weapon={disable_blocking_for_seconds:5}]

item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f weapon with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]
item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f weapon.offhand with milk_bucket[item_model="wander:empty",use_remainder={id:"bucket",count:1,components:{item_model:"wander:empty"}}]

execute unless score bad_omen wander.data matches 1 run item replace entity @s armor.head with iron_ingot[enchantments={"wander:armor_piercing":1},equippable={slot:"head",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.chest with iron_ingot[enchantments={"wander:trader_resistance":1,"wander:mace_resistance":1},equippable={slot:"chest",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.legs with iron_ingot[enchantments={"wander:trader_resistance":1,"wander:mace_resistance":1},equippable={slot:"legs",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute unless score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.feet with iron_ingot[enchantments={"wander:trader_resistance":1,"wander:mace_resistance":1},equippable={slot:"feet",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]

execute if score bad_omen wander.data matches 1 run item replace entity @s armor.head with iron_ingot[enchantments={"wander:armor_piercing":2},equippable={slot:"head",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute if score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.chest with iron_ingot[enchantments={"wander:trader_resistance":2,"wander:mace_resistance":2},equippable={slot:"chest",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute if score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.legs with iron_ingot[enchantments={"wander:trader_resistance":2,"wander:mace_resistance":2},equippable={slot:"legs",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]
execute if score bad_omen wander.data matches 1 run item replace entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f armor.feet with iron_ingot[enchantments={"wander:trader_resistance":2,"wander:mace_resistance":2},equippable={slot:"feet",asset_id:"saddle",can_be_sheared:false,equip_sound:"intentionally_empty"},unbreakable={}]


effect clear 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f glowing
effect clear @s glowing

execute store result score @s wander.motion1 if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"movement":{"horizontal_speed":{"min":0.099}}}}