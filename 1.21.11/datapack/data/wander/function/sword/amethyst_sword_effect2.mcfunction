#advancement revoke @s only wander:attack_amethyst_cleaver

execute if score @s wander.amethyst_sword_cd matches 1.. run return 0
scoreboard players set @s wander.amethyst_sword_cd 600

scoreboard players add $resonance wander.amethyst_sword_cd 0
execute store result score $resonance wander.amethyst_sword_cd run data get entity @s SelectedItem.components."minecraft:enchantments"."wander:resonance"
scoreboard players set 50 wander.temp 40
scoreboard players operation $resonance wander.amethyst_sword_cd *= 50 wander.temp
scoreboard players operation @s wander.amethyst_sword_cd -= $resonance wander.amethyst_sword_cd

execute if score spawned wander.data matches 1 run scoreboard players set attack_cd wander.data 200

playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
particle flash{color:[1,1,1,1]} ~ ~ ~ 1.8 1 1.8 0 80 normal @a
tag @s add wander.current_player

execute if score pickle_magic wander.data matches 1 run function wander:magic_integration/cast_silence

execute if data storage wander:temp entity_type run function wander:sword/amethyst_sword_effect3 with storage wander:temp

effect give @s blindness 1 5 false
effect give @s slowness 2 0 false
effect give @s nausea 5 5 false




# execute unless entity @n[tag=wander.amethyst_target] as @e[type=!#milk:command_entities,type=!player,distance=0.1..20] run function wander:sword/amethyst_sword_damage
execute if entity @n[tag=wander.amethyst_target] as @e[tag=wander.amethyst_target,distance=0.1..20] run function wander:sword/amethyst_sword_damage

execute unless entity @n[tag=wander.amethyst_target] as @a[tag=wander.potential_target,distance=0.1..20] run function wander:sword/amethyst_sword_damage

tag @e[tag=wander.amethyst_target,distance=0.1..30] remove wander.amethyst_target
tag @s remove wander.current_player