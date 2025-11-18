#raycast setup
scoreboard players set raycast_limit wander.temp 75
execute positioned over motion_blocking_no_leaves summon area_effect_cloud unless function wander:spawn_search/zzz/cloud13 run return 0
function wander:spawn_search/raycast2