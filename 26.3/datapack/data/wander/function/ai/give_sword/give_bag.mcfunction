function wander:bag/give
playsound wander:wandering_murderer.bag hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
playsound item.trident.hit hostile @a[distance=0..16] ~ ~2 ~ 1.0 0.5 0.0
playsound wander:wandering_murderer.bag hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
playsound item.trident.hit hostile @a[distance=0..16] ~ ~2 ~ 1.0 0.5 0.0
playsound wander:wandering_murderer.bag hostile @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
playsound item.trident.hit hostile @a[distance=0..16] ~ ~2 ~ 1.0 0.5 0.0
scoreboard players set $strength player_motion.api.launch -15000
execute anchored eyes facing entity abb5e532-ba94-447e-8b50-7b463008a14c feet run function player_motion:api/launch_looking