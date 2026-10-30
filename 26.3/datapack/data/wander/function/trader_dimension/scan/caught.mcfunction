# Generated with MC-Build

playsound wander:fine_print.hit_item hostile @a[x=0] ~ ~ ~ 10 0.7 0.5
particle minecraft:totem_of_undying ~ ~1 ~ 0 0 0 0.3 40 normal @a
particle minecraft:gust ~ ~1 ~ 0 0 0 0.0 1 normal @a
effect give @s wither 10 3 false
effect give @s hunger 10 5 false
playsound minecraft:entity.wandering_trader.no hostile @a[x=0] ~ ~20 ~ 10.0 0.6 1.0
scoreboard players set check_timer wander.trader_dimension 0
execute as @n[tag=aj.fine_print.root,x=0] run function aj:fine_print/variants/sad_mask/apply