execute if entity @n[tag=wander.ai,type=wandering_trader,tag=wander.slaughterer] run return run function wander:ai/attacks/gunpowder_throw_circle

execute unless entity @p[tag=wander.target] rotated as @s facing entity @p[tag=wander.potential_target] eyes rotated ~ ~-20 run return run function wander:gunpowder/summon
execute if entity @p[tag=wander.target] rotated as @s facing entity @p[tag=wander.target] eyes rotated ~45 ~-20 run function wander:gunpowder/summon
execute if entity @p[tag=wander.target] rotated as @s facing entity @p[tag=wander.target] eyes rotated ~-45 ~-20 run function wander:gunpowder/summon
execute if entity @p[tag=wander.target] rotated as @s facing entity @p[tag=wander.target] eyes rotated ~ ~-20 run function wander:gunpowder/summon
