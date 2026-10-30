execute if entity @n[type=#wander:scares_traders,distance=0..23] rotated as @s facing entity @n[type=#wander:scares_traders,distance=0..23] eyes run return run function wander:projectiles/whey/summon

execute rotated as @s facing entity @p[tag=wander.target] feet run function wander:projectiles/whey/summon
