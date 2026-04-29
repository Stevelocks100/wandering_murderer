execute if score slaughterer_defeated wander.data matches 1 run return 0
scoreboard players set slaughterer_defeated wander.data 1
function wander:add_new_trade {offer:{weight:2,offer_item:\
{id: "minecraft:enchanted_book", count: 1, components: {"minecraft:stored_enchantments": {"wander:resonance": 1}}}\
,cost:2,cost_type:"diamond",item_name:"Resonance",max_amount:4,costs_blocks:true}}

