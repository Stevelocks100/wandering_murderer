execute if entity @n[tag=aj.wander.animation.sneak_idle.playing] run return run attribute @n[tag=wander.hitbox,type=wandering_trader,distance=0..] scale base set 1.25
execute if entity @n[tag=aj.wander.animation.sneak_walk.playing] run return run attribute @n[tag=wander.hitbox,type=wandering_trader,distance=0..] scale base set 1.25

execute if entity @n[tag=aj.wander.animation.jump_despawn.playing] run return run attribute @n[tag=wander.hitbox,type=wandering_trader,distance=0..] scale base set 0.1
execute if entity @n[tag=aj.wander.animation.jump_despawn.playing] run return run attribute @n[tag=wander.ai,type=wandering_trader,distance=0..] scale base set 0.1


execute if entity @n[tag=aj.wander.animation.angry_idle.playing] run return run attribute @n[tag=wander.hitbox,type=wandering_trader,distance=0..] scale base set 1.25

attribute @n[tag=wander.hitbox,type=wandering_trader,distance=0..] scale base set 2