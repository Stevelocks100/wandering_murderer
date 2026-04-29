execute at @n[tag=wander.sword_destination] run summon marker ~ ~ ~ {Tags:["wander.jump_target"]}
function wander:ai/jump/get_distance {target:"@n[tag=wander.jump_target]"}
function wander:ai/jump/jump_forwards
scoreboard players set dragon_egg_timer wander.data 26