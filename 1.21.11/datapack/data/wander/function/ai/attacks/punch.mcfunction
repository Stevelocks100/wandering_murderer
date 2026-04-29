execute if score ai wander.data matches 33 as @p[tag=wander.target] at @s rotated as @s run return run function wander:ai/give_sword/give_bag

execute as @a[distance=0..2.0] run tag @s add wander.do_damage
execute positioned ~ ~-1 ~ as @a[distance=0..2.5] run tag @s add wander.do_damage
execute at @s as @a[distance=0..3.0] run tag @s add wander.do_damage

execute as @a[tag=wander.do_damage] run damage @s 6 mob_attack by @n[tag=wander.ai]

execute as @a[tag=wander.do_damage] if predicate {"condition":"minecraft:random_chance","chance":0.4} run effect give @s poison 3 0 false
execute at @s as @a[distance=0..1.4] run effect give @s poison 6 0 false
tag @a[tag=wander.do_damage] remove wander.do_damage

playsound entity.puffer_fish.blow_up hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
