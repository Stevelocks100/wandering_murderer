
execute if score jump_tick wander.data matches -12 as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute if score jump_tick wander.data matches -12 as @n[tag=aj.wander.root] run function animated_java:wander/animations/jump_to_sword/tween {to_frame:0,duration:2}
execute if score jump_tick wander.data matches -12 run scoreboard players set ai wander.data -3
execute if score jump_tick wander.data matches -12..300 as @n[tag=aj.wander.root] if entity @n[tag=wander.sword_proj_display] run function animated_java:wander/variants/sword_none/apply
execute if score jump_tick wander.data matches -12 if entity @n[tag=wander.sword_proj_display_landed,distance=0..7] run scoreboard players set jump_tick wander.data 42

execute if score break_out wander.data matches 1 if score jump_tick wander.data matches 1..19 unless function wander:ai/underground/underground_check run scoreboard players set jump_tick wander.data 21

execute if score jump_tick wander.data matches 0 run function wander:ai/jump/get_distance
execute if score jump_tick wander.data matches -11..39 facing entity @n[tag=wander.sword_proj_display_landed] eyes if entity @n[tag=wander.sword_proj_display] run tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0
execute if score jump_tick wander.data matches -11..39 facing entity @p[tag=wander.target] eyes unless entity @n[tag=wander.sword_proj_display] run tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0
scoreboard players add jump_tick wander.data 1
execute if score break_out wander.data matches 1 run data modify storage wander:temp final_distance set value 12.5d
execute if score jump_tick wander.data matches 1..41 run function wander:ai/jump/main2 with storage wander:temp
execute if score break_out wander.data matches 1 if score jump_tick wander.data matches 21.. run scoreboard players set jump_tick wander.data 300

execute if score break_out wander.data matches 1 rotated as @n[tag=aj.wander.root] positioned ^ ^-1 ^2 run function wander:ai/destory_nearby/init
execute if score break_out wander.data matches 1 run function wander:ai/destory_nearby/init


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

execute if score break_out wander.data matches 1 if score jump_tick wander.data matches 1..16 run data modify entity @s Motion[1] set value 0.8d
execute if score break_out wander.data matches 1 if score jump_tick wander.data matches 21.. run function wander:ai/jump/main2 with storage wander:temp
execute if score break_out wander.data matches 1 if score jump_tick wander.data matches 21.. facing entity @p[tag=wander.target] feet positioned 0.0 0.0 0.0 rotated ~ -30 positioned ^ ^ ^2 summon area_effect_cloud run data modify entity @n[tag=wander.ai] Motion set from entity @s Pos

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

execute if score jump_tick wander.data matches 41.. if entity @s[nbt={OnGround:1b}] run function wander:ai/animation_macro {idle:'angry_idle',move:'angry_run'}
execute if score jump_tick wander.data matches 41.. if entity @n[tag=wander.sword_proj_display_landed] run function wander:ai/pathfind_macro {target:'@n[tag=wander.sword_proj_display_landed]'}
execute if score jump_tick wander.data matches 41.. unless entity @n[tag=wander.sword_proj_display_landed] run function wander:ai/jump/pick_up

execute if score jump_tick wander.data matches 41.. run attribute @s generic.movement_speed base set 1.2
execute if score jump_tick wander.data matches ..40 run attribute @s generic.movement_speed base set 0.0

execute if entity @s[nbt={OnGround:1b}] if score jump_tick wander.data matches 42.. if entity @n[tag=wander.sword_proj_display_landed,distance=0..3] run function wander:ai/jump/pick_up
execute if entity @s[nbt={OnGround:1b}] if score jump_tick wander.data matches 42.. positioned ~ ~3 ~ if entity @n[tag=wander.sword_proj_display_landed,distance=0..3] run function wander:ai/jump/pick_up

execute if score jump_tick wander.data matches 150.. run function wander:ai/jump/pick_up