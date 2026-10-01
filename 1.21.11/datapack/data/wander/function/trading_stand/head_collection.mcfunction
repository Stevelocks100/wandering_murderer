data modify block ^ ^ ^ Items set value []
data modify block ^ ^ ^1 Items set value []


execute if data storage wander:temp head_collection[0] run data modify block ^ ^ ^ Items append value {id:"player_head",count:1,Slot:0b}
execute if data storage wander:temp head_collection[0] run data modify block ^ ^ ^ Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[0]

execute if data storage wander:temp head_collection[1] run data modify block ^ ^ ^ Items append value {id:"player_head",count:1,Slot:1b}
execute if data storage wander:temp head_collection[1] run data modify block ^ ^ ^ Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[1]

execute if data storage wander:temp head_collection[2] run data modify block ^ ^ ^ Items append value {id:"player_head",count:1,Slot:2b}
execute if data storage wander:temp head_collection[2] run data modify block ^ ^ ^ Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[2]

execute if data storage wander:temp head_collection[3] run data modify block ^ ^ ^1 Items append value {id:"player_head",count:1,Slot:0b}
execute if data storage wander:temp head_collection[3] run data modify block ^ ^ ^1 Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[3]

execute if data storage wander:temp head_collection[4] run data modify block ^ ^ ^1 Items append value {id:"player_head",count:1,Slot:1b}
execute if data storage wander:temp head_collection[4] run data modify block ^ ^ ^1 Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[4]

execute if data storage wander:temp head_collection[5] run data modify block ^ ^ ^1 Items append value {id:"player_head",count:1,Slot:2b}
execute if data storage wander:temp head_collection[5] run data modify block ^ ^ ^1 Items[-1].components."minecraft:profile" set from storage wander:temp head_collection[5]

