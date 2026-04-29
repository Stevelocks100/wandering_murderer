
playsound wander:wandering_murderer.bag hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0

execute if items entity @s weapon.mainhand *[item_model="wander:bag"] run tag @s add wander.mainhand_bag
tag @s[tag=!wander.mainhand_bag] add wander.offhand_bag

execute rotated as @s positioned 0.0 0.0 0.0 positioned ^ ^ ^1.4 summon marker run function wander:bag/get_motion
summon item_display ~ ~ ~ {Tags:["wander.temp_bag"]}
execute if entity @s[tag=wander.mainhand_bag] run item replace entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] contents from entity @s weapon.mainhand
execute if entity @s[tag=wander.offhand_bag] run item replace entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] contents from entity @s weapon.offhand

data modify entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] item.components."minecraft:custom_data".bag_contents[-1].Motion set from storage wander:temp Motion
data modify storage wander:temp bag.output.entity set from entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] item.components."minecraft:custom_data".bag_contents[-1]
data modify storage wander:temp bag.output.id set from storage wander:temp bag.output.entity.id
data remove entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] item.components."minecraft:custom_data".bag_contents[-1]
execute if data storage wander:temp bag.output{id:"minecraft:tnt"} run data modify storage wander:temp bag.output.entity.Owner set from entity @s UUID

execute if entity @s[tag=wander.mainhand_bag] run item replace entity @s weapon.mainhand from entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] contents
execute if entity @s[tag=wander.offhand_bag] run item replace entity @s weapon.offhand from entity @n[tag=wander.temp_bag,distance=0..0.1,type=item_display] contents

data modify storage wander:temp bag.output.entity.Tags append value "wander.from_bag"

execute positioned ~ ~1.2 ~ run function wander:bag/summon_entity with storage wander:temp bag.output

kill @n[tag=wander.temp_bag]
tag @s remove wander.mainhand_bag
tag @s remove wander.offhand_bag

function wander:bag/update_durability