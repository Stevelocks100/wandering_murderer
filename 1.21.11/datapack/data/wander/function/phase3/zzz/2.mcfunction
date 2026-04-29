# Generated with MC-Build

scoreboard players set sneak wander.temp 0
playsound minecraft:entity.villager.yes master @s ~ ~300 ~ 0.01 1.0 0.01
tag @s add wander.sneak
schedule function wander:phase3/zzz/4 30s replace