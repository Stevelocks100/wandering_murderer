advancement revoke @s only wander:consume_whey
scoreboard players set @s wander.whey 0
tag @s add wander.whey

attribute @s scale modifier add wander:whey 0.5 add_multiplied_total
attribute @s movement_speed modifier add wander:whey 0.5 add_multiplied_total
attribute @s jump_strength modifier add wander:whey 0.5 add_multiplied_total
attribute @s step_height modifier add wander:whey 1 add_value
attribute @s entity_interaction_range modifier add wander:whey 0.5 add_multiplied_total
attribute @s block_interaction_range modifier add wander:whey 0.5 add_multiplied_total
attribute @s attack_damage modifier add wander:whey 0.5 add_multiplied_total
attribute @s attack_knockback modifier add wander:whey 0.25 add_value
attribute @s fall_damage_multiplier modifier add wander:whey -0.3 add_multiplied_total
attribute @s safe_fall_distance modifier add wander:whey 3 add_multiplied_total
attribute @s gravity modifier add wander:whey 0.25 add_multiplied_total