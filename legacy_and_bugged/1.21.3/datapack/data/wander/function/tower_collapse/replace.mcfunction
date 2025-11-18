execute if block ~ ~ ~ #wander:air_ish run return 0
execute if block ~ ~ ~ #wander:immovable run return 0

data remove storage wander:temp BlockState
summon item_display ~ ~ ~ {Tags:["wander.get_block"]}
loot replace entity @n[tag=wander.get_block] contents loot blockstate:get
data modify storage wander:temp BlockState set from entity @n[tag=wander.get_block] item.components."minecraft:custom_data"
execute unless data storage wander:temp BlockState.Properties run data modify storage wander:temp BlockState.Properties set value {}
setblock ~ ~ ~ air
execute if data storage wander:temp {BlockState:{Name:"minecraft:water"}} run kill @n[tag=wander.get_block]
execute if data storage wander:temp {BlockState:{Name:"minecraft:lava"}} run kill @n[tag=wander.get_block]

execute if data storage wander:temp {BlockState:{Name:"minecraft:water"}} run return 0
execute if data storage wander:temp {BlockState:{Name:"minecraft:lava"}} run return 0

data modify storage wander:temp BlockState.Motion set value [0.0d,0.0d,0.0d]
execute if score tower_explosion wander.data matches 1 store result storage wander:temp BlockState.Motion[0] double 0.1 run random value -7..7
execute if score tower_explosion wander.data matches 1 store result storage wander:temp BlockState.Motion[1] double 0.1 run random value 5..7
execute if score tower_explosion wander.data matches 1 store result storage wander:temp BlockState.Motion[2] double 0.1 run random value -7..7
execute align xyz positioned ~0.5 ~ ~0.5 run function wander:tower_collapse/replace2 with storage wander:temp BlockState
kill @n[tag=wander.get_block]