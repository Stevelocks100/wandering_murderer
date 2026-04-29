# Generated with MC-Build

advancement revoke @s only wander:fine_print/hit_stand
advancement revoke @s only wander:fine_print/hit_trader
execute unless entity @n[tag=aj.fine_print.node.hitbox,distance=0..,type=interaction] run return 0
execute if data entity @n[tag=aj.fine_print.node.hitbox,distance=0..,type=interaction] {width:0.0f} run return 0
advancement grant @s only wander:story/scammed
execute if function wander:fine_print/trade as @n[tag=aj.fine_print.root] run function animated_java:fine_print/animations/trade_item/play