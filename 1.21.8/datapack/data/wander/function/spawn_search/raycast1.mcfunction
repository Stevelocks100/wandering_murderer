#raycast setup
scoreboard players set raycast_limit wander.temp 75
execute positioned over motion_blocking_no_leaves run summon marker ~ ~ ~ {Tags:["wander.temp"]}
execute as @n[tag=wander.temp] at @s positioned over ocean_floor unless entity @s[distance=0..1] run return run kill
kill @n[tag=wander.temp]
function wander:spawn_search/raycast2