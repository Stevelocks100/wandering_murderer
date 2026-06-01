# Generated with MC-Build

execute as @a[tag=wander.trader_dimension.leaving] at @s if entity @n[tag=wander.ai] run function wander:trader_dimension/zzz/0
execute if score daytime wander.data matches -501 run tag @a[tag=wander.trader_dimension.leaving] remove wander.trader_dimension.leaving
execute as @a at @s unless dimension wander:pocket run scoreboard players set @s wander.trader_dimension.chests_opened 0
execute if predicate {"condition":"minecraft:random_chance","chance":0.005} as @n[tag=wander.trader_dimension.spawn,distance=0..] at @s unless entity @p[distance=0..10] unless entity @n[tag=aj.wander_chest.root,type=item_display,distance=0..2] run function aj:wander_chest/animations/open/play
execute if score bad_omen wander.data matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.04} as @n[tag=wander.trader_dimension.spawn,distance=0..] at @s unless entity @p[distance=0..10] unless entity @n[tag=aj.wander_chest.root,type=item_display,distance=0..2] run function wander:trader_dimension/zzz/1
execute unless entity @p[distance=0..] run function wander:trader_dimension/zzz/2
execute as @e[tag=wander.trader_dimension.spawn,distance=0..] at @s run function wander:trader_dimension/zzz/3
# execute if entity @p[distance=0..] unless entity @n[tag=aj.wander_chest.root,distance=0..] run function spawn_chests
execute as @e[tag=wander.trader_dimension.mob,distance=0..] at @s run function wander:trader_dimension/chest/mob_tick
execute as @e[tag=aj.wander_chest.node.hitbox,scores={wander.trader_dimension.cooldown=1..}] at @s run function wander:trader_dimension/zzz/4
execute as @a[distance=0..] at @s run function wander:trader_dimension/zzz/5
execute as @a at @s unless dimension wander:pocket run function wander:trader_dimension/zzz/6
execute unless entity @n[tag=aj.fine_print.root,distance=0..] if entity @n[tag=wander.trader_dimension.light,distance=0..] run function wander:trader_dimension/scan/remove_light