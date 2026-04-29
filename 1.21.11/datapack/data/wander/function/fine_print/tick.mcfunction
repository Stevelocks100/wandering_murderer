# Generated with MC-Build

execute as @n[tag=aj.fine_print.root,type=item_display,distance=0..] run function wander:fine_print/zzz/1
execute if score ai wander.fine_print matches 3 if entity @n[tag=aj.fine_print.root,type=item_display,distance=0..] run schedule function wander:fine_print/tick 1t replace