# Generated with MC-Build

# already facing target, at the spawn spot, as the target
execute store result score current wander.temp run data get entity @s Rotation[0]
execute positioned ^ ^ ^-2 align xyz positioned ~0.5 ~ ~0.5 positioned over motion_blocking_no_leaves summon item_display run function wander:spawning/raycast/zzz/4