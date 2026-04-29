#advancement revoke @s only wander:attack_amethyst_cleaver

execute if score @s wander.amethyst_sword_cd matches 1.. run return 0
scoreboard players set @s wander.amethyst_sword_cd 600

scoreboard players add $resonance wander.amethyst_sword_cd 0
execute store result score $resonance wander.amethyst_sword_cd run data get entity @s SelectedItem.components."minecraft:enchantments"."wander:resonance"
scoreboard players set 20 wander.temp 20
scoreboard players operation $resonance wander.amethyst_sword_cd *= 20 wander.temp
scoreboard players operation @s wander.amethyst_sword_cd -= $resonance wander.amethyst_sword_cd

execute if score spawned wander.data matches 1 run scoreboard players set attack_cd wander.data 200

playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
particle flash{color:[1,1,1,1]} ~ ~ ~ 1.8 1 1.8 0 80 normal @a
tag @s add wander.current_player

execute as @e[type=!#milk:command_entities,type=!player,distance=0.1..20] run damage @s 6 wander:amethyst_cleaver_effect by @p[tag=wander.current_player]
effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] slowness 5 1 false
effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] slowness 1 3 false

execute as @a[tag=wander.potential_target,distance=0.1..20] run damage @s 6 wander:amethyst_cleaver_effect by @p[tag=wander.current_player]
effect give @a[tag=wander.potential_target,distance=0.1..20] slowness 5 1 false
effect give @s slowness 2 0 false

effect give @a[tag=wander.potential_target,distance=0.1..20] slowness 1 3 false
effect give @a[tag=wander.potential_target,distance=0..20] nausea 5 5 false
effect give @a[tag=wander.potential_target,distance=0.1..20] blindness 3 5 false
effect give @s blindness 1 5 false

tag @s remove wander.current_player