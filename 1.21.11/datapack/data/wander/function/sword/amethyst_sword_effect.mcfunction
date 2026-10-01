#advancement revoke @s only wander:attack_amethyst_cleaver
data remove storage wander:temp entity_type
function wander:sword/get_entity_id
execute on attacker at @s run return run function wander:sword/amethyst_sword_effect2
execute at @s run function wander:sword/amethyst_sword_effect2