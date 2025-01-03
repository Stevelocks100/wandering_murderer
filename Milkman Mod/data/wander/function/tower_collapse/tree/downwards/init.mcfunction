kill @e[tag=wander.tower_bottom]
kill @e[tag=wander.tower_bottom_target]
kill @e[tag=wander.tower_checked]
execute align y run summon marker ~ ~-0.5 ~ {Tags:["wander.tower_detection"]}
function wander:tower_collapse/tree/downwards/recursive