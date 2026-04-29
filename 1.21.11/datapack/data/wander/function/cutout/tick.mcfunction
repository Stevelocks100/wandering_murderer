scoreboard players add @s wander.cutout_timer 1
execute as @s[scores={wander.cutout_timer=600..}] at @s run function wander:cutout/destroy
scoreboard players add @n[tag=wander.cutout_jukebox] wander.cutout_timer 1
execute if score @s wander.cutout_timer matches ..400 as @n[tag=wander.cutout_jukebox,scores={wander.cutout_timer=18..},distance=0..20,type=item_display] at @s run particle note ~ ~1.2 ~ 0.1 0 0.1 0.6 1 normal @a
scoreboard players set @n[tag=wander.cutout_jukebox,scores={wander.cutout_timer=18..},type=item_display,distance=0..20] wander.cutout_timer 0
