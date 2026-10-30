#sword

execute if score ice_projectile_count wander.data matches 1.. if entity @s[tag=wander.ice_proj] run function wander:projectiles/ice/tick
execute if score sword_projectile_count wander.data matches 1.. if entity @s[tag=wander.sword_proj] run function wander:projectiles/sword/tick

