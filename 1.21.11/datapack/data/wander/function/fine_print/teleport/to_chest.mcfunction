# Generated with MC-Build

execute at @n[tag=aj.wander.locator.chest,distance=0..,type=item_display] if entity @s[distance=0..0.4] run scoreboard players set current_pos wander.fine_print -1
execute unless score current_pos wander.fine_print = desired_pos wander.fine_print at @s facing entity @n[tag=aj.wander.locator.chest,distance=0..,type=item_display] feet positioned ^ ^ ^0.35 run return run tp @s ~ ~ ~ ~ 0
execute at @n[tag=aj.wander.locator.chest,distance=0..,type=item_display] facing entity @n[tag=aj.wander.locator.chest,distance=0..,type=item_display] feet run tp @s ~ ~-0.15 ~ ~ 0
execute if entity @s[tag=aj.fine_print.animation.bring_item.playing] run rotate @s ~ 0