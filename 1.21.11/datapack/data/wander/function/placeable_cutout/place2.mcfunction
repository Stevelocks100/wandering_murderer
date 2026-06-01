data merge entity @s {Tags:["wander.placeable_cutout"],item:{id:"flint",count:1,components:{"minecraft:item_model":"wander:cutout"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[2.75,2.75,2.75],translation:[0,4.125,-1.75]}}
summon interaction ~ ~ ~ {Tags:["wander.placeable_cutout_int","new"],width:2,height:5}
ride @n[tag=wander.placeable_cutout_int,tag=new,type=interaction,distance=0..0.1] mount @s
execute on passengers run tag @s remove new

rotate @s ~ 0