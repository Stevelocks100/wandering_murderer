
execute as @a[distance=0..2.0] run tag @s add wander.do_damage
execute positioned ~ ~-1 ~ as @a[distance=0..2.5] run tag @s add wander.do_damage
execute at @s as @a[distance=0..3.0] run tag @s add wander.do_damage

execute as @a[tag=wander.do_damage] unless score hard_mode wander.data matches 1 run damage @s 8 mob_attack by @n[tag=wander.ai]
execute as @a[tag=wander.do_damage] if score hard_mode wander.data matches 1 run damage @s 12 mob_attack by @n[tag=wander.ai]

execute as @a[tag=wander.do_damage] if predicate {"condition":"minecraft:random_chance","chance":0.4} run effect give @s poison 6 0 false
execute at @s as @a[distance=0..2.5] run effect give @s poison 10 0 false
tag @a[tag=wander.do_damage] remove wander.do_damage

playsound entity.puffer_fish.blow_up hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
