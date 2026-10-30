scoreboard players set attack_cd wander.data 150
execute if score pickle_magic wander.data matches 1 run function wander:magic_integration/cast_silence
playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
playsound wander:wandering_murderer.amethyst_sword_hit hostile @a[distance=0..64] ~ ~ ~ 4.0 1.0 0.5
particle flash{color:[1,1,1,1]} ~ ~ ~ 1.8 1 1.8 0 80 normal @a
execute as @a[gamemode=!creative,gamemode=!spectator,distance=0.1..20] run damage @s 4 wander:amethyst_cleaver_effect by abb5e532-ba94-447e-8b50-7b463008a14c
effect give @a[gamemode=!creative,gamemode=!spectator,distance=0.1..20] slowness 10 1 false
effect give @a[gamemode=!creative,gamemode=!spectator,distance=0.1..20] slowness 1 5 false
effect give @a[gamemode=!creative,gamemode=!spectator,distance=0.1..20] nausea 5 5 false
effect give @a[gamemode=!creative,gamemode=!spectator,distance=0.1..20] blindness 3 5 false
# execute as @e[type=!#milk:command_entities,type=!player,distance=0.1..20] run damage @s 4 wander:amethyst_cleaver_effect by abb5e532-ba94-447e-8b50-7b463008a14c
# effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] slowness 10 1 false
# effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] slowness 1 5 false
# effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] nausea 5 5 false
# effect give @e[type=!#milk:command_entities,type=!player,distance=0.1..20] blindness 3 5 false
