summon arrow ~ ~ ~ {Tags:["wander.ice_proj","new"],item:{id:"minecraft:milk_bucket",count:1,components:{"item_model":"wander:empty"}},Passengers:[{id:"minecraft:item_display",teleport_duration:1,Tags:["wander.ice_proj_display"],item:{id:"minecraft:blue_ice",count:1},transformation:{left_rotation:[0.0d,0.0d,0.0d,1.0d],right_rotation:[0.0d,0.0d,0.0d,1.0d],scale:[1.0d,1.0d,1.0d],translation:[0.0d,-0.6d,0.0d]}}],SoundEvent:"minecraft:intentionally_empty"}
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 summon area_effect_cloud run function wander:projectiles/ice/zzz/cloud11
tag @n[tag=wander.ice_proj,tag=new] remove new