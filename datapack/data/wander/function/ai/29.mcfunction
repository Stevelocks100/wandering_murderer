function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
attribute @s generic.movement_speed base set 0
execute if entity @p[tag=wander.potential_target,distance=0..10] run forceload remove ~ ~
execute if entity @p[tag=wander.potential_target,distance=0..10] run function wander:ai/stalk/drink_potion