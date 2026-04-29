# Generated with MC-Build

execute if score @s wander.launch_cd matches 1.. run return 0
#execute if entity @s[type=player] at @n[tag=<%prefix%>.wall_center] facing entity @s feet rotated ~ 0 positioned ^ ^ ^41 positioned ~-2 50 ~-2 unless entity @s[dx=3,dy=400,dz=3] run return 0
execute if entity @s[type=player] at @n[tag=wander.phase3.wall_center] facing entity @s feet rotated ~ 0 positioned ^ ^ ^44 positioned ~-4 50 ~-4 unless entity @s[dx=7,dy=400,dz=7] run return 0
execute if entity @s[type=!player] at @n[tag=wander.phase3.wall_center] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned ~-4 50 ~-4 unless entity @s[dx=7,dy=400,dz=7] run return 0
execute if score @s[type=!player] wander.phase3.launched matches 1.. run return 0
execute if function wander:bag/valid_entity run damage @s 5
playsound wander:phase3.hit_wall hostile @a[distance=0..100] ~ ~ ~ 3.0 1.0 0.0
playsound wander:phase3.hit_wall_far hostile @a[distance=50..100] ~ ~ ~ 6.0 1.0 0.0
function wander:phase3/walls/bounce
execute if entity @s[type=player] run return run function wander:phase3/walls/zzz/20
execute if entity @s[type=ender_pearl] run return run function wander:phase3/walls/zzz/21
return run function wander:phase3/walls/zzz/23