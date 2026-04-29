# Generated with MC-Build

function wander:fine_print/per_player/read
execute if score index wander.fine_print matches 0.. run function wander:fine_print/zzz/13
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".wander.stolen run data modify storage wander:fine_print current.stolen_items append from entity @s equipment.offhand
summon item_display ~ ~ ~ {Tags:["wander.fine_print.temp_trade"]}
item replace entity @n[tag=wander.fine_print.temp_trade,distance=0..,type=item_display] contents from entity @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] contents
item replace entity @n[tag=aj.fine_print.node.item_display,type=item_display,distance=0..] contents from entity @s weapon.offhand
item replace entity @s weapon.offhand from entity @n[tag=wander.fine_print.temp_trade,distance=0..,type=item_display] contents
kill @n[tag=wander.fine_print.temp_trade,distance=0..,type=item_display]
function wander:fine_print/per_player/write
return 1