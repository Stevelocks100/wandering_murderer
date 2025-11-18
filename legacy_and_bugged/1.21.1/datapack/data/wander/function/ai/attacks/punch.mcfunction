summon marker ~ ~ ~ {CustomName:'{"text":"Wandering Trader"}',Tags:["wander.damage"]}
execute positioned ~ ~-2 ~ as @a[distance=0..3] run damage @s 7 mob_attack by @n[tag=wander.damage]
execute positioned ~ ~-2 ~ as @a[distance=0..3] run effect give @s poison 10 0 false
playsound entity.puffer_fish.blow_up hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
kill @e[tag=wander.damage]