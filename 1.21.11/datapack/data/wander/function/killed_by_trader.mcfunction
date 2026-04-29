advancement revoke @s only wander:killed
scoreboard players add @s wander.deaths 1
scoreboard players add timer wander.data 400

execute if entity @s[tag=wander.target] if score desired_pos wander.fine_print matches -2 run function wander:fine_print/to_bag

tag @s remove wander.target

execute if score 33%health wander.data matches -1 run tag @s add wander.phase3.trapped



function wander:get_name
data modify storage wander:temp head_collection append from storage wander:temp name
execute if data storage wander:temp head_collection[6] run data remove storage wander:temp head_collection[0]