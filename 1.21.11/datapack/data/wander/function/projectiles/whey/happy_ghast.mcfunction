
execute as @n[type=happy_ghast,distance=0..20,dx=5,dy=5,dz=5] at @s run function wander:sandbags/summon
damage @n[type=happy_ghast,distance=0..20,dx=5,dy=5,dz=5] 1 mob_attack by @n[tag=wander.ai]