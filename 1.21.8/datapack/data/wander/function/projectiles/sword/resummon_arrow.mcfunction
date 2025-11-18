summon arrow ~ ~ ~ {Tags:["wander.sword_proj","new","wander.sword_proj_dont_explode"],item:{id:"minecraft:milk_bucket",count:1,components:{"item_model":"wander:empty"}},SoundEvent:"minecraft:intentionally_empty"}
ride @s mount @n[tag=wander.sword_proj,tag=new]
execute unless data entity @s data.Motion run tag @n[tag=wander.sword_proj,tag=new] remove new
tag @s remove wander.sword_proj_display_landed

execute unless data entity @s data.Motion run return 0

execute store result entity @s data.Motion[0] double -0.001 run data get entity @s data.Motion[0] 1000
#execute store result entity @s data.Motion[1] double -0.001 run data get entity @s data.Motion[1] 1000
execute store result entity @s data.Motion[2] double -0.001 run data get entity @s data.Motion[2] 1000

data modify entity @n[tag=wander.sword_proj] Motion set from entity @s data.Motion
tag @n[tag=wander.sword_proj,tag=new] remove new