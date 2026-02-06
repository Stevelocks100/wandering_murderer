scoreboard players add @s wander.killed_trader 1
execute if score do_spawning milk.settings matches -1 run return 0
execute if score daytime wander.data matches -500.. run return 0
#execute if predicate {"condition":"minecraft:random_chance","chance":0.50} run return 0

execute unless score @s wander.killed_trader matches 2.. unless score defeated wander.data matches 1 run return run tellraw @a[distance=0..20] ["",{color:"dark_red",italic:true,text:"<???> \"I would recommend not doing that again, ",extra:[{selector:"@s"},".\""]}]
execute unless score @s wander.killed_trader matches 2.. if score defeated wander.data matches 1 run return run tellraw @a[distance=0..20] ["",{color:"dark_red",italic:true,text:"<Wandering Murderer> \"I would recommend not doing that again, ",extra:[{selector:"@s"},".\""]}]

function wander:initiate
playsound entity.lightning_bolt.thunder player @a ^ ^ ^100 100000000 0.8 1.0