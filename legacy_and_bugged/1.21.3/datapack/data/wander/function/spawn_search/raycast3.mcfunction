#spawn marker and probably other stuff later
execute positioned ^ ^ ^-2 align xyz positioned ~0.5 ~ ~0.5 positioned over motion_blocking_no_leaves run summon item_display ~ ~ ~ {Tags:["wander.potential_spawn","new"]}
execute as @n[tag=wander.potential_spawn,tag=new] at @s rotated as @s run function wander:spawn_search/spawn_entity_setup

