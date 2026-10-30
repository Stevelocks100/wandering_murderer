execute store result score droplet_count milk.temp if entity @n[tag=milk.droplet,type=armor_stand]
execute store result score puddle_count milk.temp if entity @n[tag=milk.puddle,type=armor_stand]


execute as @e[tag=milk.splash,type=armor_stand] at @s run function milk:become_puddle

execute as @e[tag=milk.droplet,predicate=wander:on_ground,type=armor_stand] run tag @s add milk.splash


execute as @e[tag=milk.puddle,type=armor_stand] at @s run function milk:puddle_tick
execute store result score puddle_count milk.puddle if entity @e[tag=milk.puddle,type=armor_stand]
execute if score puddle_count milk.puddle matches 150.. as @e[tag=milk.puddle,scores={milk.puddle=150..},type=armor_stand] run function milk:remove
execute if score puddle_count milk.puddle matches 200.. run scoreboard players add @e[tag=milk.puddle,type=armor_stand] milk.puddle 5

execute as @e[tag=milk.puddle,scores={milk.puddle=300..},type=armor_stand,limit=15,sort=random] run function milk:remove

execute if score puddle_count milk.temp matches 1.. run return run schedule function milk:puddle_schedule 1t
execute if score droplet_count milk.temp matches 1.. run return run schedule function milk:puddle_schedule 1t