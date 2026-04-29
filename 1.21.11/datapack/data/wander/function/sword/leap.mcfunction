advancement revoke @s only wander:use_sword
function wander:infinite_item {item_model:"wander:hugeasssword"}

execute if entity @s[advancements={wander:use_amethyst_cleaver=true}] run effect clear @s poison
advancement revoke @s only wander:use_amethyst_cleaver
function wander:infinite_item {item_model:"wander:amethyst_cleaver"}

function wander:ai/jump_vanish_particles
scoreboard players set $strength player_motion.api.launch 40000
execute rotated ~ -35 run function player_motion:api/launch_looking
scoreboard players set @s wander.sword 0
tag @s add wander.sword_jump