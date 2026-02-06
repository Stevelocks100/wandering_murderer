
execute positioned ~ ~-2 ~ as @a[distance=0..3] run damage @s 5 in_fire by @n[tag=wander.ai]
execute positioned ~ ~-2 ~ as @a[distance=0..3] run effect give @s blindness 10 0 false
execute positioned ~ ~-2 ~ as @a[distance=0..3] run effect give @s slowness 10 1 false
particle squid_ink ~ ~-1 ~ 1.2 1.2 1.2 0 20 normal @a
