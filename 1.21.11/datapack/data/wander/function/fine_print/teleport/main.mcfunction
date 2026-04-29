# Generated with MC-Build

execute at @s unless entity @n[tag=aj.wander.root,distance=0..15,type=item_display] run scoreboard players operation current_pos wander.fine_print = desired_pos wander.fine_print
execute at @n[tag=aj.fine_print.node.hitbox,distance=0..,type=interaction] if entity @s[tag=aj.fine_print.animation.loop.playing] run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.6 0.3 0 1 normal @a
execute at @n[tag=aj.fine_print.node.hitbox,distance=0..,type=interaction] if entity @s[tag=aj.fine_print.animation.bring_item.playing] run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.6 0.3 0 1 normal @a
execute rotated as @n[tag=aj.wander.root] run rotate @s ~ 0
execute if score desired_pos wander.fine_print matches 1 rotated as @s run function wander:fine_print/teleport/1
execute if score desired_pos wander.fine_print matches 2 rotated as @s run function wander:fine_print/teleport/2
execute if score desired_pos wander.fine_print matches 3 rotated as @s run function wander:fine_print/teleport/3
execute if score desired_pos wander.fine_print matches 4 rotated as @s run function wander:fine_print/teleport/4
execute if score desired_pos wander.fine_print matches 5 rotated as @s run function wander:fine_print/teleport/5
execute if score desired_pos wander.fine_print matches -1 rotated as @s run function wander:fine_print/teleport/to_chest
execute if score desired_pos wander.fine_print matches -2 rotated as @s run function wander:fine_print/teleport/in_front
kill @e[tag=wander.fine_print.stand_location,distance=0..,type=marker]