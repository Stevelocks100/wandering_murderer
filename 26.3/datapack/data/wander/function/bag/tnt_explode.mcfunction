particle explosion_emitter
playsound entity.generic.explode block @a[distance=0..100] ~ ~ ~ 4.0 0.6 0.0
execute as @e[type=!#milk:command_entities,distance=0..2] run damage @s 30 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=2..4] run damage @s 22 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=4..5.5] run damage @s 12 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=5.5..6.25] run damage @s 10 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=6.25..6.75] run damage @s 8 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=6.75..7.5] run damage @s 5 minecraft:explosion by @n[type=tnt]
execute as @e[type=!#milk:command_entities,distance=7.5..8.25] run damage @s 2 minecraft:explosion by @n[type=tnt]

kill @s