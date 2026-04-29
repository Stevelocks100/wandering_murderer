# Generated with MC-Build

function wander:fine_print/per_player/read
execute as @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] run function wander:fine_print/zzz/4
data modify storage wander:fine_print current.stolen_items set value []
function wander:fine_print/per_player/write