
execute if score jump_tick wander.data matches ..99 run scoreboard players set jump_tick wander.data 100
scoreboard players add jump_tick wander.data 1
execute if score jump_tick wander.data matches 101 as @n[tag=aj.wander.root] run function animated_java:wander/animations/jump_upward/tween {to_frame:0,duration:2}

execute if score jump_tick wander.data matches 113 store result score trader_y wander.temp run data get entity @s Pos[1]
execute if score jump_tick wander.data matches 113 store result score sword_y wander.temp run data get entity @n[tag=wander.sword_proj_display_landed] Pos[1]
execute if score jump_tick wander.data matches 113 store result storage wander:temp jump.height int 1 run scoreboard players operation sword_y wander.temp -= trader_y wander.temp
tag @s add wander.jump_for_sword
execute if entity @n[tag=wander.sword_proj_display_landed,distance=0..6] run function wander:ai/jump/pick_up

execute if score jump_tick wander.data matches 113 run function wander:ai/jump/move_upward with storage wander:temp jump


execute if score jump_tick wander.data matches 116.. if entity @s[nbt={OnGround:1b}] run function wander:ai/jump/pick_up
execute if score jump_tick wander.data matches 116.. if entity @s[nbt={OnGround:1b}] run scoreboard players set jump_tick wander.data -12