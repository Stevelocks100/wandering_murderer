attribute @s fall_damage_multiplier modifier add wander:leap -0.9 add_multiplied_total
scoreboard players add @s wander.sword 1

execute if score @s wander.sword matches 10.. if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_on_ground":true}}} run function wander:sword/land
execute if score @s wander.sword matches 100.. run tag @s remove wander.sword_jump
execute unless entity @s[tag=wander.sword_jump] run attribute @s fall_damage_multiplier modifier remove wander:leap
