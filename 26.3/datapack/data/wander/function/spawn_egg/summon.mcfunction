
execute unless dimension minecraft:overworld run return run kill @s
tag @s add wander.current_entity
execute if entity @n[tag=wander.spawn_egg,type=armor_stand,tag=!wander.current_entity] run kill @s
tag @s remove wander.current_entity
execute unless entity @p[tag=wander.potential_target] run return 0


execute if score daytime wander.data matches -501 if score spawned wander.data matches 0 run function wander:initiate_secret
execute if score spawned wander.data matches 1 run return run kill @s

scoreboard players set timer wander.data 7000

execute if entity @s[tag=wander.spawn_egg.wandering_murderer] run function wander:existence/summon_revenge
execute if entity @s[tag=wander.spawn_egg.sneaky_murderer] run function wander:existence/summon
execute if entity @s[tag=wander.spawn_egg.lobotomy_murderer] run function wander:existence/summon_revenge
execute if entity @s[tag=wander.spawn_egg.lobotomy_murderer] run scoreboard players set ai wander.data 26
execute if entity @s[tag=wander.spawn_egg.wandering_slaughterer] run function wander:existence/summon_slaughterer


kill @s