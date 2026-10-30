#kill @n[tag=wander.tower_bottom]
#kill @n[tag=wander.tower_bottom_target]
#
#execute if predicate wander:lone_tower positioned ~ ~1 ~ run summon marker ~ ~ ~ {Tags:["wander.tower_bottom"]}
#execute if block ~ ~ ~ #wander:can_pass run summon marker ~ ~ ~ {Tags:["wander.tower_bottom"]}
#
#execute if entity @n[tag=wander.tower_bottom] as @n[tag=wander.tower_bottom] at @s facing entity abb5e532-ba94-447e-8b50-7b463008a14c feet rotated ~ 0 positioned ^ ^ ^2 run summon marker ~ ~ ~ {Tags:["wander.tower_bottom_target"]}
#
#execute if block ~ ~ ~ #wander:can_pass run return 0
#execute if predicate wander:lone_tower positioned ~ ~1 ~ run return 0
#execute align xyz positioned ~0.5 ~-1 ~0.5 run function wander:tower_collapse/get_tower_bottom
function wander:tower_collapse/tree/downwards/init
return run execute if entity @n[tag=wander.tower_bottom]