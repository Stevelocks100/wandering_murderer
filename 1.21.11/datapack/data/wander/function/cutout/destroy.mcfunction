execute rotated as @s run particle block_crumble{block_state:{Name:"oak_planks"}} ^ ^2 ^-0.6 1 1.5 1 1 400 normal @a
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.4 1.0 0.0
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.4 1.0 0.0
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.4 1.0 0.0

kill @n[tag=wander.cutout_jukebox,distance=0..5]
tp @n[tag=wander.cutout_jukebox_hitbox,distance=0..5] ~ -1000 ~
kill @n[tag=wander.cutout_jukebox_hitbox,distance=0..5]
kill @s