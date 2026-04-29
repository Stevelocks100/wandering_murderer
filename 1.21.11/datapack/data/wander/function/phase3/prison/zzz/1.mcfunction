# Generated with MC-Build

execute if predicate {"condition":"minecraft:random_chance","chance":0.005} run playsound wander:phase3.emerald_hum hostile @a[distance=0..48] ~ ~ ~ 2.0 1.0 0.0
execute unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"type":"minecraft:player"}}} run return run function wander:phase3/prison/zzz/2
execute on passengers if entity @s[type=slime] store result score prison_health wander.temp run data get entity @s Health
execute unless score @s wander.phase3.health_old = prison_health wander.temp run playsound block.amethyst_block.break hostile @a[distance=0..64] ~ ~ ~ 3.0 0.7 0.0
execute unless score @s wander.phase3.health_old = prison_health wander.temp run particle item{item:{id:"iron_ingot",components:{"minecraft:item_model":"wander:emerald_prison"}}} ~ ~ ~ 0.3 0.3 0.3 0.2 40 force @a[distance=0..64]
execute if score prison_health wander.temp matches ..950 on passengers if entity @s[type=player] run function wander:phase3/prison/destroy_nearest
scoreboard players operation @s wander.phase3.health_old = prison_health wander.temp