execute if score jump_tick wander.data matches ..41 run scoreboard players add jump_tick wander.data 1
execute if entity @n[tag=wander.jump_target] run data modify storage wander:temp jump.target set value "@n[tag=wander.jump_target]"
execute if score jump_tick wander.data matches 1..41 run function wander:ai/jump/move_forward with storage wander:temp jump
data remove entity @s wander_target
execute if score jump_tick wander.data matches -11 as @n[tag=aj.wander.root] run function animated_java:wander/animations/jump_to_sword/tween {to_frame:0,duration:2}


execute if score jump_tick wander.data matches 2 run tag @s add wander.jump_for_target

execute if score jump_tick wander.data matches 1 run data modify entity @s Motion[1] set value 1.00d
execute if score jump_tick wander.data matches 2 run data modify entity @s Motion[1] set value 0.95d
execute if score jump_tick wander.data matches 3 run data modify entity @s Motion[1] set value 0.90d
execute if score jump_tick wander.data matches 4 run data modify entity @s Motion[1] set value 0.85d
execute if score jump_tick wander.data matches 5 run data modify entity @s Motion[1] set value 0.80d
execute if score jump_tick wander.data matches 6 run data modify entity @s Motion[1] set value 0.75d
execute if score jump_tick wander.data matches 7 run data modify entity @s Motion[1] set value 0.70d
execute if score jump_tick wander.data matches 8 run data modify entity @s Motion[1] set value 0.65d
execute if score jump_tick wander.data matches 9 run data modify entity @s Motion[1] set value 0.60d
execute if score jump_tick wander.data matches 10 run data modify entity @s Motion[1] set value 0.55d
execute if score jump_tick wander.data matches 11 run data modify entity @s Motion[1] set value 0.50d
execute if score jump_tick wander.data matches 12 run data modify entity @s Motion[1] set value 0.45d
execute if score jump_tick wander.data matches 13 run data modify entity @s Motion[1] set value 0.40d
execute if score jump_tick wander.data matches 14 run data modify entity @s Motion[1] set value 0.35d
execute if score jump_tick wander.data matches 15 run data modify entity @s Motion[1] set value 0.30d
execute if score jump_tick wander.data matches 16 run data modify entity @s Motion[1] set value 0.25d
execute if score jump_tick wander.data matches 17 run data modify entity @s Motion[1] set value 0.20d
execute if score jump_tick wander.data matches 18 run data modify entity @s Motion[1] set value 0.15d
execute if score jump_tick wander.data matches 19 run data modify entity @s Motion[1] set value 0.10d
execute if score jump_tick wander.data matches 20 run data modify entity @s Motion[1] set value 0.05d
execute if score jump_tick wander.data matches 21 run data modify entity @s Motion[1] set value -0.00d
execute if score jump_tick wander.data matches 22 run data modify entity @s Motion[1] set value -0.05d
execute if score jump_tick wander.data matches 23 run data modify entity @s Motion[1] set value -0.10d
execute if score jump_tick wander.data matches 24 run data modify entity @s Motion[1] set value -0.15d
execute if score jump_tick wander.data matches 25 run data modify entity @s Motion[1] set value -0.20d
execute if score jump_tick wander.data matches 26 run data modify entity @s Motion[1] set value -0.25d
execute if score jump_tick wander.data matches 27 run data modify entity @s Motion[1] set value -0.30d
execute if score jump_tick wander.data matches 28 run data modify entity @s Motion[1] set value -0.35d
execute if score jump_tick wander.data matches 29 run data modify entity @s Motion[1] set value -0.40d
execute if score jump_tick wander.data matches 30 run data modify entity @s Motion[1] set value -0.45d
execute if score jump_tick wander.data matches 31 run data modify entity @s Motion[1] set value -0.50d
execute if score jump_tick wander.data matches 32 run data modify entity @s Motion[1] set value -0.55d
execute if score jump_tick wander.data matches 33 run data modify entity @s Motion[1] set value -0.60d
execute if score jump_tick wander.data matches 34 run data modify entity @s Motion[1] set value -0.65d
execute if score jump_tick wander.data matches 35 run data modify entity @s Motion[1] set value -0.70d
execute if score jump_tick wander.data matches 36 run data modify entity @s Motion[1] set value -0.75d
execute if score jump_tick wander.data matches 37 run data modify entity @s Motion[1] set value -0.80d
execute if score jump_tick wander.data matches 38 run data modify entity @s Motion[1] set value -0.85d
execute if score jump_tick wander.data matches 39 run data modify entity @s Motion[1] set value -0.90d
execute if score jump_tick wander.data matches 40 run data modify entity @s Motion[1] set value -0.95d
execute if score jump_tick wander.data matches 41 run data modify entity @s Motion[1] set value -1.00d
execute if score jump_tick wander.data matches 41.. run attribute @s movement_speed base set 1.2
execute if score jump_tick wander.data matches ..40 run attribute @s movement_speed base set 0.0
execute if score jump_tick wander.data matches 41.. run kill @e[tag=wander.jump_target]
execute if score jump_tick wander.data matches 42.. run scoreboard players set jump_tick wander.data -12
#execute if score jump_tick wander.data matches 150.. run function wander:ai/jump/pick_up