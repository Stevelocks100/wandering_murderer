kill @e[tag=wander.sword_proj_display]
summon arrow ~ ~ ~ {Tags:["wander.sword_proj","new"],item:{id:"minecraft:milk_bucket",count:1,components:{"custom_model_data":1}},Passengers:[{id:"minecraft:item_display",teleport_duration:1,Tags:["wander.sword_proj_display"],item:{id:"minecraft:netherite_sword",count:1,components:{"custom_model_data":1}},transformation:{left_rotation:[0.0d,0.0d,0.0d,1.0d],right_rotation:[0.0d,0.0d,0.0d,1.0d],scale:[2.0d,2.0d,2.0d],translation:[0.0d,-0.8d,0.0d]}}],SoundEvent:"minecraft:intentionally_empty"}
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 summon area_effect_cloud run data modify entity @n[tag=wander.sword_proj,tag=new] Motion set from entity @s Pos
tag @n[tag=wander.sword_proj,tag=new] remove new