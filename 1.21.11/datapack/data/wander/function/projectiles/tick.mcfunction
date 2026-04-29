#sword

execute as @e[tag=wander.ice_proj] at @s run function wander:projectiles/ice/tick
execute as @e[tag=wander.sword_proj] at @s run function wander:projectiles/sword/tick
execute if entity @n[tag=wander.gunpowder_proj] unless entity @n[tag=wander.gunpowder] run function wander:gunpowder/tick
execute if entity @n[tag=wander.gunpowder] run function wander:gunpowder/tick