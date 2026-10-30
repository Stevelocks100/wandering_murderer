# Generated with MC-Build

particle gust ~ ~ ~ 0 0 0 0 1 force @a[distance=0..100]
# tag @s add <%prefix%>.current_entity
execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] facing entity @s feet rotated ~ 0 positioned ^ ^ ^40 positioned over motion_blocking facing entity @s feet rotated ~ -5 positioned 0.0 0.0 0.0 positioned ^ ^ ^3 summon marker run function wander:phase3/walls/zzz/25
data modify entity @s Motion set from storage wander:temp Motion
# tag @s remove <%prefix%>.current_entity