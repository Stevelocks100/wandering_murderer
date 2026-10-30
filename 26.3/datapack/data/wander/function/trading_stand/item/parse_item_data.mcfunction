# item data:
#
# offer_item: an item stack nbt
# item_name: string for item name
# cost: amount of emeralds. clampted between 1 and 64
# costs_blocks: determines when emeralds or emerald blocks will be required for the trade.
# cost_type: type of item. available: "emerald", "diamond", "netherite", "gold", "iron", "copper"
#
# max_amount: optional, during the time trading, this is how many will be offered before selling out.
# global_limit: only works if max amount exists. will limit the amount of this item in the world.
#               good for things like dragon egg.
#
#
# weight: how common it is. 1 = very rare, and 10 = common. please do not go above 10 so that other
#               datapack trades can be offered.
#               weight -1 means it is guarenteed to appear.

$data modify storage wander:trades trading_stand.item set value $(offer)
#execute if data storage wander:trades trading_stand.item{cost_type:"emerald"}
data modify storage wander:trades trading_stand.item.macro.block set value ""
data modify storage wander:trades trading_stand.item.macro.translation_type set value "item.minecraft."
execute unless data storage wander:trades trading_stand.item.item_name run data modify storage wander:trades trading_stand.item.item_name set value "Item name"

execute unless data storage wander:trades trading_stand.item.costs_blocks if data storage wander:trades trading_stand.item{cost_type:"netherite"} run data modify storage wander:trades trading_stand.item.cost_type set value "netherite_ingot"
execute unless data storage wander:trades trading_stand.item.costs_blocks if data storage wander:trades trading_stand.item{cost_type:"gold"} run data modify storage wander:trades trading_stand.item.cost_type set value "gold_ingot"
execute unless data storage wander:trades trading_stand.item.costs_blocks if data storage wander:trades trading_stand.item{cost_type:"iron"} run data modify storage wander:trades trading_stand.item.cost_type set value "iron_ingot"
execute unless data storage wander:trades trading_stand.item.costs_blocks if data storage wander:trades trading_stand.item{cost_type:"copper"} run data modify storage wander:trades trading_stand.item.cost_type set value "copper_ingot"


execute if data storage wander:trades trading_stand.item.costs_blocks run data modify storage wander:trades trading_stand.item.macro.translation_type set value "block.minecraft."
execute if data storage wander:trades trading_stand.item.costs_blocks run data modify storage wander:trades trading_stand.item.macro.block set value "_block"
data modify storage wander:trades trading_stand.item.macro.item set from storage wander:trades trading_stand.item.cost_type

data modify storage wander:trades trading_stand.item.macro.cost set from storage wander:trades trading_stand.item.cost

execute store result score cost wander.temp run data get storage wander:trades trading_stand.item.cost
execute if score cost wander.temp matches 65.. run data modify storage wander:trades trading_stand.item.cost set value 64
execute if score cost wander.temp matches ..0 run data modify storage wander:trades trading_stand.item.cost set value 1

function wander:trading_stand/item/parse_item_data_cost with storage wander:trades trading_stand.item.macro

execute unless data storage wander:trades trading_stand.item.global_limit run data modify storage wander:trades trading_stand.item.global_limit set value "false"
data modify storage wander:trades trading_stand.item{global_limit:true}.global_limit set value "true" 

execute unless data storage wander:trades trading_stand.item.max_amount run data modify storage wander:trades trading_stand.item.max_amount set value -5
data modify storage wander:trades trading_stand.item.amount_text set value {text:"",color:"white"}

execute unless data storage wander:trades trading_stand.item{max_amount:-5} run function wander:trading_stand/item/parse_item_data_amount with storage wander:trades trading_stand.item
data modify storage wander:trades trading_stand.item.item_limit set value "false"
execute unless data storage wander:trades trading_stand.item{max_amount:-5} run data modify storage wander:trades trading_stand.item.item_limit set value "true"
execute if data storage wander:trades trading_stand.item{max_amount:-5} run data modify storage wander:trades trading_stand.item.max_amount set value 1

execute store result storage wander:trades trading_stand.item.uuid int 1 run random value -147483648..1947483646

data remove storage wander:trades trading_stand.item.cost_type
data remove storage wander:trades trading_stand.item.macro