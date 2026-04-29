execute if items entity @s weapon.mainhand *[item_model="wander:bag"] run tag @s add wander.mainhand_bag
tag @s[tag=!wander.mainhand_bag] add wander.offhand_bag


execute if entity @s[tag=wander.mainhand_bag] store result score bag_contents_count wander.temp run data get entity @s SelectedItem.components."minecraft:custom_data".bag_contents
execute if entity @s[tag=wander.offhand_bag] store result score bag_contents_count wander.temp run data get entity @s equipment.offhand.components."minecraft:custom_data".bag_contents

execute if items entity @s weapon.mainhand *[item_model="wander:bag"] run item modify entity @s weapon.mainhand {"function":"minecraft:set_damage","damage":{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"bag_contents_count"},"score":"wander.temp","scale":0.1666666667},"conditions":[]}
execute if items entity @s weapon.offhand *[item_model="wander:bag"] run item modify entity @s weapon.offhand {"function":"minecraft:set_damage","damage":{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"bag_contents_count"},"score":"wander.temp","scale":0.1666666667},"conditions":[]}

data modify storage wander:temp bag_content_text set value ["","Contents:"]
execute if entity @s[tag=wander.mainhand_bag] run data modify storage wander:temp bag_content_text append string entity @s SelectedItem.components."minecraft:custom_data".bag_contents[4].id 10
execute if entity @s[tag=wander.mainhand_bag] run data modify storage wander:temp bag_content_text append string entity @s SelectedItem.components."minecraft:custom_data".bag_contents[3].id 10
execute if entity @s[tag=wander.mainhand_bag] run data modify storage wander:temp bag_content_text append string entity @s SelectedItem.components."minecraft:custom_data".bag_contents[2].id 10
execute if entity @s[tag=wander.mainhand_bag] run data modify storage wander:temp bag_content_text append string entity @s SelectedItem.components."minecraft:custom_data".bag_contents[1].id 10
execute if entity @s[tag=wander.mainhand_bag] run data modify storage wander:temp bag_content_text append string entity @s SelectedItem.components."minecraft:custom_data".bag_contents[0].id 10


execute if entity @s[tag=wander.offhand_bag] run data modify storage wander:temp bag_content_text append string entity @s equipment.offhand.components."minecraft:custom_data".bag_contents[4].id 10
execute if entity @s[tag=wander.offhand_bag] run data modify storage wander:temp bag_content_text append string entity @s equipment.offhand.components."minecraft:custom_data".bag_contents[3].id 10
execute if entity @s[tag=wander.offhand_bag] run data modify storage wander:temp bag_content_text append string entity @s equipment.offhand.components."minecraft:custom_data".bag_contents[2].id 10
execute if entity @s[tag=wander.offhand_bag] run data modify storage wander:temp bag_content_text append string entity @s equipment.offhand.components."minecraft:custom_data".bag_contents[1].id 10
execute if entity @s[tag=wander.offhand_bag] run data modify storage wander:temp bag_content_text append string entity @s equipment.offhand.components."minecraft:custom_data".bag_contents[0].id 10

function wander:bag/update_durability_macro with storage wander:temp

tag @s remove wander.mainhand_bag
tag @s remove wander.offhand_bag