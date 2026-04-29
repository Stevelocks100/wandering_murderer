# Generated with MC-Build

execute unless score daytime wander.data matches -500..0 run return 0
execute at 0849bc57-4d67-414b-a371-b71c45e02a14 unless entity @s[distance=0..0.1] run return 0
scoreboard players add sneak wander.temp 8
playsound minecraft:block.note_block.snare master @s ~ ~300 ~ 0.01 1.0 0.01
execute if score sneak wander.temp matches 40.. run function wander:phase3/zzz/2