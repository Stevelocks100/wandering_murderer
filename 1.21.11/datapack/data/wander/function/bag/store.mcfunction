summon item_display ~ ~ ~ {Tags:["wander.bag_vehicle"]}
ride @n[tag=wander.bag_target] mount @n[tag=wander.bag_vehicle]
tag @n[tag=wander.bag_target] remove wander.bag_target
data modify storage wander:temp bag.entity set from entity @n[tag=wander.bag_vehicle] Passengers[0]

tp @n[tag=wander.bag_vehicle] ~ -1000 ~
execute as @n[tag=wander.bag_vehicle] on passengers run kill

kill @n[tag=wander.bag_vehicle]


execute if items entity @s weapon.mainhand *[item_model="wander:bag"] run tag @s add wander.mainhand_bag
tag @s[tag=!wander.mainhand_bag] add wander.offhand_bag


item modify entity @s[tag=wander.mainhand_bag] weapon.mainhand {"function":"minecraft:copy_custom_data","source":{"type":"minecraft:storage","source":"wander:temp"},"ops":[{"source":"bag.entity","target":"bag_contents","op":"append"}],"conditions":[]}
item modify entity @s[tag=wander.offhand_bag] weapon.offhand {"function":"minecraft:copy_custom_data","source":{"type":"minecraft:storage","source":"wander:temp"},"ops":[{"source":"bag.entity","target":"bag_contents","op":"append"}],"conditions":[]}

function wander:bag/update_durability