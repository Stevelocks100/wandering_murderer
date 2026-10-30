tag @s add wander.current_trader
execute on attacker if entity @s[tag=wander.hit_check] run tag @n[tag=wander.current_trader] add wander.hit_trader
tag @s remove wander.current_trader