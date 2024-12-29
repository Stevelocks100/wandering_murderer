#raycast setup
scoreboard players set raycast_limit wander.temp 150
execute positioned over motion_blocking_no_leaves summon area_effect_cloud positioned over ocean_floor unless entity @s[distance=0..1] run return 0
function wander:spawn_search/raycast2