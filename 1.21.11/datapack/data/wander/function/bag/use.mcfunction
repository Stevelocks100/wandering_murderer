advancement revoke @s only wander:use_bag


function wander:infinite_item {item_model:"wander:bag"}

execute if items entity @s weapon.mainhand *[item_model="wander:bag"] run tag @s add wander.mainhand_bag
tag @s[tag=!wander.mainhand_bag] add wander.offhand_bag

execute if entity @s[tag=wander.mainhand_bag] store result score bag_contents_count wander.temp run data get entity @s SelectedItem.components."minecraft:custom_data".bag_contents
execute if entity @s[tag=wander.offhand_bag] store result score bag_contents_count wander.temp run data get entity @s equipment.offhand.components."minecraft:custom_data".bag_contents

tag @s remove wander.mainhand_bag
tag @s remove wander.offhand_bag

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} if score bag_contents_count wander.temp matches 1.. run return run function wander:bag/retrieve
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} unless score bag_contents_count wander.temp matches 1.. run title @s times 0 40 20
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} unless score bag_contents_count wander.temp matches 1.. run return run title @s actionbar "The bag is empty!"

execute if score bag_contents_count wander.temp matches 5.. run title @s times 0 40 20
execute if score bag_contents_count wander.temp matches 5.. run return run title @s actionbar {text:"The bag is full!"}


execute anchored eyes positioned ^ ^ ^1 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#milk:command_entities,distance=0..6,dx=0,dy=0,dz=0] if function wander:bag/valid_entity run tag @s add wander.potential_bag_target
execute anchored eyes positioned ^ ^ ^2 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#milk:command_entities,distance=0..6,dx=0,dy=0,dz=0] if function wander:bag/valid_entity run tag @s add wander.potential_bag_target
execute anchored eyes positioned ^ ^ ^3 positioned ~-0.5 ~-0.5 ~-0.5 as @e[type=!#milk:command_entities,distance=0..6,dx=0,dy=0,dz=0] if function wander:bag/valid_entity run tag @s add wander.potential_bag_target
execute anchored eyes positioned ^ ^2 ^ run tag @n[tag=wander.potential_bag_target,distance=0..10,type=#wander:can_stash] add wander.bag_target

tag @e[tag=wander.potential_bag_target,distance=0..10] remove wander.potential_bag_target

execute unless entity @n[tag=wander.bag_target] run return 0

function wander:bag/store
playsound wander:wandering_murderer.bag hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
