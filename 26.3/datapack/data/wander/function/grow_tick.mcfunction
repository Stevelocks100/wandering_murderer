scoreboard players add @s wander.grow 1
attribute @s scale modifier remove wander:escape
execute if score @s wander.grow matches 1 run attribute @s scale modifier add wander:escape -0.9 add_multiplied_total
execute if score @s wander.grow matches 2 run attribute @s scale modifier add wander:escape -0.85 add_multiplied_total
execute if score @s wander.grow matches 3 run attribute @s scale modifier add wander:escape -0.8 add_multiplied_total
execute if score @s wander.grow matches 4 run attribute @s scale modifier add wander:escape -0.75 add_multiplied_total
execute if score @s wander.grow matches 5 run attribute @s scale modifier add wander:escape -0.7 add_multiplied_total
execute if score @s wander.grow matches 6 run attribute @s scale modifier add wander:escape -0.65 add_multiplied_total
execute if score @s wander.grow matches 7 run attribute @s scale modifier add wander:escape -0.6 add_multiplied_total
execute if score @s wander.grow matches 8 run attribute @s scale modifier add wander:escape -0.55 add_multiplied_total
execute if score @s wander.grow matches 9 run attribute @s scale modifier add wander:escape -0.50 add_multiplied_total
execute if score @s wander.grow matches 10 run attribute @s scale modifier add wander:escape -0.45 add_multiplied_total
execute if score @s wander.grow matches 11 run attribute @s scale modifier add wander:escape -0.40 add_multiplied_total
execute if score @s wander.grow matches 12 run attribute @s scale modifier add wander:escape -0.35 add_multiplied_total
execute if score @s wander.grow matches 13 run attribute @s scale modifier add wander:escape -0.30 add_multiplied_total
execute if score @s wander.grow matches 14 run attribute @s scale modifier add wander:escape -0.25 add_multiplied_total
execute if score @s wander.grow matches 15 run attribute @s scale modifier add wander:escape -0.20 add_multiplied_total
execute if score @s wander.grow matches 16 run attribute @s scale modifier add wander:escape -0.15 add_multiplied_total
execute if score @s wander.grow matches 17 run attribute @s scale modifier add wander:escape -0.10 add_multiplied_total
execute if score @s wander.grow matches 18 run attribute @s scale modifier add wander:escape -0.05 add_multiplied_total
execute if score @s wander.grow matches 19 run attribute @s scale modifier remove wander:escape
execute if score @s wander.grow matches 20 run tag @s remove wander.grow
