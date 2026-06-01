# Generated with MC-Build

tag @s remove wander.fine_print.give_back
data modify entity @s Item set from entity @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] item
data modify entity @s Owner set from entity @p[tag=wander.fine_print.target] UUID