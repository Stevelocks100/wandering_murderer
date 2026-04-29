# Generated with MC-Build

execute if score sneak wander.temp matches 1.. run scoreboard players remove sneak wander.temp 1
execute as 0849bc57-4d67-414b-a371-b71c45e02a14 if entity @s[advancements={wander:phase3/sneaking=true}] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":false}}} run advancement revoke @s only wander:phase3/sneaking
execute if score walls_enabled wander.phase3.wall_spawn matches 1 run function wander:phase3/walls/tick
execute as @e[tag=wander.phase3.broken_wall] at @s run function wander:phase3/zzz/0
function wander:phase3/prison/tick