# Generated with MC-Build

execute unless predicate wander:is_mounted if entity @n[tag=wander.phase3.prison,distance=0..10,type=item_display] run ride @s mount @n[tag=wander.phase3.prison,distance=0..10,type=item_display]
execute unless predicate wander:is_mounted unless entity @n[tag=wander.phase3.prison,distance=0..10,type=item_display] run function wander:phase3/prison/trap
effect give @s resistance 10 5 true
effect give @s saturation 10 5 true
effect give @s weakness 2 50 true