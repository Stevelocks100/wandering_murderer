# Generated with MC-Build

execute unless entity @s[distance=0..100] run return 0
execute unless block ~ ~ ~ #wander:can_pass run return 0
execute positioned ~-2 ~-2 ~-2 if entity @n[tag=wander.ai,type=wandering_trader,dx=3,dy=3,dz=3] run return 1
execute positioned ^ ^ ^1 run return run function wander:murderer_music/zzz/13