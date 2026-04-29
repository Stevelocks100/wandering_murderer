tag @s add wander.current_sandbag
execute if entity @n[tag=!wander.current_sandbag,tag=wander.sandbag,distance=0..0.5] store result entity @s Motion[0] double 0.1 run random value -5..5
execute if entity @n[tag=!wander.current_sandbag,tag=wander.sandbag,distance=0..0.5] store result entity @s Motion[2] double 0.1 run random value -5..5

scoreboard players add @s wander.gunpowder_timer 1
execute if score @s wander.gunpowder_timer matches 1000.. on passengers run kill
execute if score @s wander.gunpowder_timer matches 1000.. run tp @s ~ ~-1000 ~
execute if score @s wander.gunpowder_timer matches 1000.. run kill
scoreboard players set ghast_rotation wander.temp 50
execute store result score sandbag wander.temp on leasher run data get entity @s Motion[1] 1000
execute store result score ghast_rotation wander.temp on leasher run data get entity @s Rotation[0] 100
scoreboard players set 100 wander.temp 100
scoreboard players operation ghast_rotation wander.temp %= 100 wander.temp
execute if entity @s[nbt={OnGround:0b}] run scoreboard players remove sandbag wander.temp 5
execute on leasher unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{}}} store result entity @s Motion[1] double 0.001 run scoreboard players get sandbag wander.temp
execute if entity @s[nbt={OnGround:0b}] on leasher if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{}}} at @s run tp @s ~ ~-0.03 ~
execute if entity @s[nbt={OnGround:0b}] on leasher if score ghast_rotation wander.temp matches 0 at @s run tp @s ~ ~-0.03 ~

tag @s remove wander.current_sandbag