#1 = punch
#2 = stew
#3 = throw ice
#4 = throw sword
#attack_ai wander.data


execute if score attack_duration wander.data matches 1.. run scoreboard players remove attack_duration wander.data 1
execute if score attack_duration wander.data matches ..0 run data modify entity @s NoAI set value 0b
execute if score attack_duration wander.data matches ..0 run scoreboard players set attack_ai wander.data 0
execute if score attack_duration wander.data matches ..0 if entity @s[tag=wander.follow_success] run function wander:ai/drink_potion


#execute unless entity @p[tag=tower.success] run kill @n[tag=wander.tower_bottom]
#execute unless entity @p[tag=tower.success] run kill @n[tag=wander.tower_bottom_target]

