# Generated with MC-Build

execute as @n[tag=aj.fine_print.root,type=item_display,distance=0..] run function animated_java:fine_print/animations/bring_item/play
scoreboard players set index wander.fine_print -1
loot replace entity @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] contents loot wander:fine_print/trade_item
execute if predicate {"condition":"minecraft:random_chance","chance":0.40} as @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] run function wander:fine_print/zzz/6