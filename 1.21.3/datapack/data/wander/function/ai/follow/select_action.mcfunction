#1-5 = stew
#3-6 = sucker punch
#4-6 = abduct
tp @n[tag=aj.wander.root] ~ ~ ~ facing entity @p[tag=wander.target]
data modify entity @s NoAI set value 1b
execute if score @p[tag=wander.target] wander.encounters matches ..1 run scoreboard players set random_action wander.temp 1
execute if score @p[tag=wander.target] wander.encounters matches 2 store result score random_action wander.temp run random value 1..2
execute if score @p[tag=wander.target] wander.encounters matches 3..5 store result score random_action wander.temp run random value 1..3
execute if score @p[tag=wander.target] wander.encounters matches 6.. store result score random_action wander.temp run random value 2..3

tag @s add wander.follow_success
execute if score random_action wander.temp matches 3 if score do_kidnapping milk.settings matches -1 store result score random_action wander.temp run random value 1..2
execute if score random_action wander.temp matches 1 run function wander:ai/attacks/stew_init
execute if score random_action wander.temp matches 2 run function wander:ai/attacks/punch_init
execute if score random_action wander.temp matches 3 run effect give @p[tag=wander.target] slowness 6 90 true
execute if score random_action wander.temp matches 3 run function wander:ai/attacks/abduct_init
#1 = stew
#2 = punch
#3 = abduct

scoreboard players add timer wander.data 200