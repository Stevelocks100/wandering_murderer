execute unless score dance_chance wander.data matches 10 run function wander:ai/animation_macro {move:'sneak_idle',idle:'sneak_idle'}
execute if score dance_chance wander.data matches 10 run function wander:ai/animation_macro {move:'macarena',idle:'macarena'}

attribute @s generic.movement_speed base set 0.0
execute facing entity @p[tag=wander.target] eyes run tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0
scoreboard players remove standoff wander.data 1
execute if score standoff wander.data matches ..0 as @p[tag=wander.target] run function wander:ai/stalk/noticed
