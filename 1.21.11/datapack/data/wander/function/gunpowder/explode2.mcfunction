particle explosion ~ ~ ~ 0.1 0.1 0.1 0 1 force @a
execute if score bad_omen wander.data matches 1 if data entity @s {OnGround:1b} if block ~ ~ ~ air unless block ~ ~-1 ~ air run particle flame ~ ~0.1 ~ 0.3 0.3 0.3 0.3 70 normal @a
execute if score bad_omen wander.data matches 1 if data entity @s {OnGround:1b} if block ~ ~ ~ air unless block ~ ~-1 ~ air run summon marker ~ ~ ~ {Tags:["wander.bad_omen_fire"]}
execute if score bad_omen wander.data matches 1 if data entity @s {OnGround:1b} if block ~ ~ ~ air unless block ~ ~-1 ~ air run setblock ~ ~ ~ fire strict

playsound entity.generic.explode block @a[distance=0..48] ~ ~ ~ 0.4 1.4 0.0
execute as @e[distance=0..3,type=!#milk:command_entities,nbt={HurtTime:0s}] run damage @s 15 wander:gunpowder
execute as @e[distance=3..4.5,type=!#milk:command_entities,nbt={HurtTime:0s}] run damage @s 10 wander:gunpowder
execute as @e[distance=4.5..5,type=!#milk:command_entities,nbt={HurtTime:0s}] run damage @s 9 wander:gunpowder
execute as @e[distance=5..6.5,type=!#milk:command_entities,nbt={HurtTime:0s}] run damage @s 5 wander:gunpowder

tag @n[tag=wander.gunpowder,type=armor_stand,distance=0.01..20,limit=2] add wander.gunpowder_explode
tag @n[tag=wander.gunpowder,type=armor_stand,distance=0.01..2,limit=9] add wander.gunpowder_explode

kill @s