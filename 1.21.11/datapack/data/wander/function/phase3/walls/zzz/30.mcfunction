# Generated with MC-Build

rotate @s ~ ~
data merge entity @s {item:{id:"emerald",count:1,components:{"minecraft:item_model":"wander:broken_emerald1"}},transformation:{translation:[0,0,0],scale:[30,30,30],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1]},Tags:["wander.phase3.broken_wall"],teleport_duration:10,interpolation_duration:100,brightness:{sky:15,block:15}}
execute store result entity @s interpolation_duration int 1 run random value 80..120