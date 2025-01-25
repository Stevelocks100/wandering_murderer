#$execute positioned 0.0 0.0 0.0 rotated 0 0 facing ^-$(a) ^ ^$(b) run tp @s ^$(a) ^ ^$(b) 0 0
data modify storage manhunt_goal:temp distance.a_player set from entity @s Pos[0]
data modify storage manhunt_goal:temp distance.b_player set from entity @s Pos[2]
execute store result score a_player wander.temp run data get storage manhunt_goal:temp distance.a_player
execute if score a_player wander.temp matches ..-1 store result storage manhunt_goal:temp distance.a_player float -0.001 run data get storage manhunt_goal:temp distance.a_player 1000

execute store result score b_player wander.temp run data get storage manhunt_goal:temp distance.b_player
execute if score b_player wander.temp matches ..-1 store result storage manhunt_goal:temp distance.b_player float -0.001 run data get storage manhunt_goal:temp distance.b_player 1000

#execute facing 0 ~ 0 rotated ~180 0 positioned 0.0 ~ 0.0 positioned ^ ^ ^1000 summon area_effect_cloud run function manhunt_goal:distance_check_aec
execute summon area_effect_cloud run function manhunt_goal:distance_check2 with storage manhunt_goal:temp distance
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run title @s[tag=!manhunt_goal.sneaking] times 0 40 20
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run title @s[tag=!manhunt_goal.sneaking] actionbar ["",{"nbt":"result.int","storage":"manhunt_goal:temp"}," / 1000 blocks travelled"]
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run tag @s add manhunt_goal.sneaking
execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run tag @s remove manhunt_goal.sneaking

execute store result score distance wander.temp run data get storage manhunt_goal:temp result.int
execute unless entity @s[tag=wander.potential_target] run return 0

execute if score distance wander.temp matches 1000.. if score daytime wander.data matches 3.. run scoreboard players set manhunt_goal wander.data 0
execute if score distance wander.temp matches 1000.. if score daytime wander.data matches 3.. run scoreboard players set daytime wander.data 2
