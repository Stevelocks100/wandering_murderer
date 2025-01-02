
execute rotated as @s facing entity @p[tag=wander.target] eyes if entity @p[tag=wander.target,distance=0..6] run function wander:projectiles/ice/summon
execute rotated as @s facing entity @p[tag=wander.target] eyes if entity @p[tag=wander.target,distance=6..13] rotated ~ ~-4 run function wander:projectiles/ice/summon
execute rotated as @s facing entity @p[tag=wander.target] eyes if entity @p[tag=wander.target,distance=13..18] rotated ~ ~-8 run function wander:projectiles/ice/summon
execute rotated as @s facing entity @p[tag=wander.target] eyes if entity @p[tag=wander.target,distance=18..23] rotated ~ ~-12 run function wander:projectiles/ice/summon
execute rotated as @s facing entity @p[tag=wander.target] eyes if entity @p[tag=wander.target,distance=23..] rotated ~ ~-16 run function wander:projectiles/ice/summon
