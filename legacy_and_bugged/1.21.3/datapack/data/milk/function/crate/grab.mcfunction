advancement revoke @s only milk:use_crate/use_crate0
advancement revoke @s only milk:use_crate/use_crate1
advancement revoke @s only milk:use_crate/use_crate2
advancement revoke @s only milk:use_crate/use_crate3
advancement revoke @s only milk:use_crate/use_crate4

execute if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{flags:{is_sneaking:1b}}} run return 0


scoreboard players add @s milk.crate_progress 0
execute unless score @s milk.crate_progress matches ..0 run return 0

execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".crate run return 0

execute store result score @s milk.dropped run data get entity @s SelectedItem.components."minecraft:custom_data".bottles
execute if score @s milk.dropped matches 0 run return 0


execute if data entity @s Inventory[{Slot:-106b}] run function milk:crate/replace_offhand

item replace entity @s weapon.offhand from entity @s weapon.mainhand

scoreboard players add @s milk.crate_progress 2

item replace entity @s weapon.mainhand with beetroot_soup[item_model="wander:molotov_milktail",max_stack_size=16,food={saturation: 0.0f, nutrition: 0, can_always_eat: 1b},consumable={consume_seconds:99999999},custom_name='{"italic":false,"text":"Molotov Milktail"}',rarity="rare",custom_data={milk:1b},hide_additional_tooltip={}]

execute if score @s milk.dropped matches 4 run item modify entity @s weapon.offhand milk:crates/3
execute if score @s milk.dropped matches 3 run item modify entity @s weapon.offhand milk:crates/2
execute if score @s milk.dropped matches 2 run item modify entity @s weapon.offhand milk:crates/1
execute if score @s milk.dropped matches 1 run item modify entity @s weapon.offhand milk:crates/0
scoreboard players set @s milk.dropped 0
scoreboard players set @s milk.puddle 2