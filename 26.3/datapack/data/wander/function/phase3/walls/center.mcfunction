# Generated with MC-Build

kill @n[tag=wander.phase3.wall_center,type=marker,x=0]
execute if entity @n[tag=wander.jimmy,type=marker] at @n[tag=wander.jimmy,type=marker] run return run function wander:phase3/walls/zzz/7
execute positioned over motion_blocking align xyz run summon marker ~0.5 ~ ~0.5 {Tags:["wander.phase3.wall_center","wander.entity"]}