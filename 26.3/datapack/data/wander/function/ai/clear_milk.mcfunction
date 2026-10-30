execute if predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"minecraft:periodic_tick":2}} run \
item replace entity @s weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"milk_bucket",count:1,components:{item_model:"wander:empty"}}]
execute if predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"minecraft:periodic_tick":2}} run \
item replace entity @s[tag=wander.break_shield] weapon.mainhand with milk_bucket[item_model="wander:empty",use_remainder={id:"milk_bucket",count:1,components:{item_model:"wander:empty"}},weapon={disable_blocking_for_seconds:5}]

execute unless predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"minecraft:periodic_tick":2}} run \
item replace entity @s weapon.mainhand with milk_bucket[item_model="air",use_remainder={id:"milk_bucket",count:1,components:{item_model:"wander:empty"}}]
execute unless predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"minecraft:periodic_tick":2}} run \
item replace entity @s[tag=wander.break_shield] weapon.mainhand with milk_bucket[item_model="air",use_remainder={id:"milk_bucket",count:1,components:{item_model:"wander:empty"}},weapon={disable_blocking_for_seconds:5}]

attribute @s[tag=wander.milk_reset2] scale modifier remove wander:milk_reset
tag @s remove wander.milk_reset2

tag @s[tag=wander.milk_reset] add wander.milk_reset2
tag @s[tag=wander.milk_reset] remove wander.milk_reset

execute if predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"minecraft:periodic_tick":25}} run function wander:ai/trigger_milk

