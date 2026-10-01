# Generated with MC-Build

advancement revoke @s only wander:clock/get_days
scoreboard players operation clock_time wander.data = trading_duration wander.data
scoreboard players add clock_time wander.data 24000
scoreboard players set 24000 wander.data 24000
scoreboard players operation clock_time wander.data /= 24000 wander.data
execute if score clock_time wander.data matches 8.. run scoreboard players set clock_time wander.data 7
execute if score clock_time wander.data matches ..-1 run scoreboard players set clock_time wander.data 0
execute if items entity @s weapon.mainhand compass[item_model="wander:clock"] run item modify entity @s weapon.mainhand {"function":"minecraft:set_custom_model_data","floats":{"values":[{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"clock_time"},"score":"wander.data","scale":1}],"mode":"replace_all"}}
execute if items entity @s weapon.offhand compass[item_model="wander:clock"] run item modify entity @s weapon.offhand {"function":"minecraft:set_custom_model_data","floats":{"values":[{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"clock_time"},"score":"wander.data","scale":1}],"mode":"replace_all"}}
# scoreboard players add clock_time wander.data 1
title @s times 0 40 20
execute if score clock_time wander.data matches 8.. run return run title @s actionbar ["More than 7 days until he shows up"]
execute if score clock_time wander.data matches 0 run return run title @s actionbar ["He is here."]
execute if score clock_time wander.data matches 1 run return run title @s actionbar [{score:{name:"clock_time",objective:"wander.data"}}," day until he shows up"]
title @s actionbar [{score:{name:"clock_time",objective:"wander.data"}}," days until he shows up"]