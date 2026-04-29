summon snowball ~ ~ ~ {Tags:["wander.whey_proj","new"],Item:{id:"minecraft:milk_bucket",count:1,components:{"item_model":"wander:empty"}},Passengers:[{id:"minecraft:item_display",teleport_duration:1,Tags:["wander.whey_proj_display"],item:{id:"minecraft:iron_ingot",count:1,components:{"minecraft:item_model":"wander:whey"}},transformation:{left_rotation:[0.0d,0.0d,0.0d,1.0d],right_rotation:[0.0d,0.0d,0.0d,1.0d],scale:[1.0d,1.0d,1.0d],translation:[0.0d,0d,0.0d]}}]}
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^3 run summon marker ~ ~ ~ {Tags:["wander.temp"]}
data modify entity @n[tag=wander.whey_proj,tag=new] Motion set from entity @n[tag=wander.temp] Pos
kill @n[tag=wander.temp]
tag @n[tag=wander.whey_proj,tag=new] remove new