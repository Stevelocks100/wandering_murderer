advancement revoke @s only wander:hit_trader
scoreboard players set random_target wander.temp 0
execute unless score ai wander.data matches 20..28 if score ai wander.data matches 0.. run scoreboard players set ai wander.data 20
execute if entity @s[tag=wander.target] run return 0
execute if score ai wander.data matches 20 store result score random_target wander.temp run random value 1..20
execute if score random_target wander.temp matches 1..3 run tag @a remove wander.target
execute if score random_target wander.temp matches 1..3 run tag @s add wander.target

tag @s add wander.facing
execute if score random_target wander.temp matches 4..10 as @n[tag=wander.ai] at @s rotated as @s run function wander:ai/attacks/punch_init
execute if score random_target wander.temp matches 4..10 as @n[tag=wander.ai] at @s facing entity @p[tag=wander.facing] eyes run tp @s ~ ~ ~ ~ ~
tag @s remove wander.facing

execute unless score ai wander.data matches 20..28 if score ai wander.data matches 0.. run tag @a remove wander.target
execute unless score ai wander.data matches 20..28 if score ai wander.data matches 0.. run tag @s add wander.target

