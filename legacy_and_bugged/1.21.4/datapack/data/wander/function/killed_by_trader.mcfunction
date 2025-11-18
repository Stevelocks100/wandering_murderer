advancement revoke @s only wander:killed
scoreboard players add @s wander.deaths 1
scoreboard players add timer wander.data 400
tag @s remove wander.target
execute if score hard_mode wander.data matches 1 run scoreboard players set daytime wander.data 2
execute if score hard_mode wander.data matches 1 run scoreboard players set hard_mode wander.data -1