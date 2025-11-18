execute at @p[tag=wander.target] run summon marker ~ ~ ~ {Tags:["wander.jump_target"]}
function wander:ai/jump/get_distance {target:"@p[tag=wander.jump_target]"}
function wander:ai/jump/jump_forwards