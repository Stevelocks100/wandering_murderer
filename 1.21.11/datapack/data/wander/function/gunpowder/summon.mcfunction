
summon snowball ^ ^ ^0.3 {Tags:["wander.gunpowder_proj","new"],Item:{id:"gunpowder",count:1}}
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1.8 run summon marker ~ ~ ~ {Tags:["wander.temp"]}
data modify entity @n[tag=wander.gunpowder_proj,tag=new] Motion set from entity @n[tag=wander.temp] Pos
kill @n[tag=wander.temp]
tag @n[tag=wander.gunpowder_proj,tag=new] remove new