
$execute at @n[tag=wander.ai] unless entity $(target) facing entity @p[tag=wander.target] feet positioned 0.0 0.0 0.0 rotated ~ 0 positioned ^ ^ ^$(final_distance) run summon marker ~ ~ ~ {Tags:["wander.temp"]}
$execute at @n[tag=wander.ai] if entity $(target) facing entity $(target) feet positioned 0.0 0.0 0.0 rotated ~ 0 positioned ^ ^ ^$(final_distance) run summon marker ~ ~ ~ {Tags:["wander.temp"]}
$execute facing entity $(target) eyes run rotate @s ~ 0
$function wander:ai/pathfind_macro {target:"$(target)"}

$execute as @n[tag=aj.wander.root] at @s facing entity $(target) eyes run rotate @s ~ 0

data modify entity @n[tag=wander.ai] Motion set from entity @n[tag=wander.temp] Pos
kill @n[tag=wander.temp]

