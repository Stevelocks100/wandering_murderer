
$execute at abb5e532-ba94-447e-8b50-7b463008a14c unless entity $(target) facing entity @p[tag=wander.target] feet positioned 0.0 0.0 0.0 rotated ~ 0 positioned ^ ^ ^$(final_distance) run summon marker ~ ~ ~ {Tags:["wander.temp","wander.entity"]}
$execute at abb5e532-ba94-447e-8b50-7b463008a14c if entity $(target) facing entity $(target) feet positioned 0.0 0.0 0.0 rotated ~ 0 positioned ^ ^ ^$(final_distance) run summon marker ~ ~ ~ {Tags:["wander.temp","wander.entity"]}
$execute facing entity $(target) eyes run rotate @s ~ 0
$function wander:ai/pathfind_macro {target:"$(target)"}

$execute as @n[tag=aj.wander.root,type=item_display] at @s facing entity $(target) eyes run rotate @s ~ 0

data modify entity abb5e532-ba94-447e-8b50-7b463008a14c Motion set from entity @n[tag=wander.temp] Pos
kill @n[tag=wander.temp]

