
execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp

tag @s add wander.big_jump
tag @s add wander.jump_landing

execute if score timer wander.fine_print matches 100.. run scoreboard players set timer wander.fine_print 99

scoreboard players add 22_jump wander.data 1
data remove entity @s wander_target
attribute @s movement_speed base set 0.0
execute if score 22_jump wander.data matches 1 as @n[tag=aj.wander.root] run function animated_java:wander/animations/jump_upward/tween {duration:1,to_frame:0}
execute if score 22_jump wander.data matches 9..25 run data modify entity @s Motion[1] set value 2.3d

execute if score 22_jump wander.data matches 40..55 facing entity @p[tag=wander.target] eyes rotated ~ ~ run function wander:ai/slaughter/motion_from_dir

execute if score 22_jump wander.data matches 110..120 facing entity @p[tag=wander.target] eyes rotated ~ ~ run function wander:ai/slaughter/motion_from_dir


#scoreboard players set $strength player_motion.api.launch -500
execute if score 22_jump wander.data matches 40..180 as @p[tag=wander.target,distance=0..10,predicate=wander:is_mounted] at @s facing entity @n[tag=wander.ai] feet rotated ~ 20 run ride @s dismount
#execute if score 22_jump wander.data matches 40..180 as @p[tag=wander.target,distance=0..10] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_ground":false}}} at @s facing entity @n[tag=wander.ai] feet rotated ~ 20 run function player_motion:api/launch_looking

scoreboard players set $strength player_motion.api.launch -18000

#execute if score 22_jump wander.data matches 40..180 as @p[tag=wander.target,distance=0..10] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_ground":true}}} at @s facing entity @n[tag=wander.ai] feet rotated ~ 20 run function wander:tower_collapse/explode_top
execute if score 22_jump wander.data matches 40..180 as @p[tag=wander.target,distance=0..10] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_ground":true}}} at @s facing entity @n[tag=wander.ai] feet rotated ~ 20 run scoreboard players set @s wander.launch_cd 20
execute if score 22_jump wander.data matches 40..180 as @p[tag=wander.target,distance=0..10] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_ground":true}}} unless score @s wander.launch_cd matches 1..19 at @s facing entity @n[tag=wander.ai] feet rotated ~ 20 run function player_motion:api/launch_looking


execute if score 22_jump wander.data matches 30.. if entity @s[nbt={OnGround:1b}] run scoreboard players set 22_jump wander.data 200
execute if score 22_jump wander.data matches 200.. run scoreboard players set ai wander.data 20
execute if score 22_jump wander.data matches 200.. run scoreboard players set 22_jump wander.data -1