playsound minecraft:entity.zombie_villager.cure block @a[distance=0..16] ~ ~ ~ 1.0 0.8 0.0
scoreboard players set .x_size scan_config 8
scoreboard players set .y_size scan_config 8
scoreboard players set .z_size scan_config 8
execute positioned ~-4 ~-4 ~-4 run function scan:scan
