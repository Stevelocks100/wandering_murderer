
# kill @n[tag=wander.cutout]
# kill @n[tag=wander.cutout_jukebox]
# tp @n[tag=wander.cutout_jukebox_hitbox] ~ -1000 ~
# kill @n[tag=wander.cutout_jukebox_hitbox]

execute unless score bad_omen wander.data matches 1 run playsound wander:wandering_murderer.fake_stereo hostile @a[distance=0..70] ~ ~ ~ 1.0 1.0 1.0
execute unless score bad_omen wander.data matches 1 run summon item_display ~ ~ ~ {Tags:["wander.cutout","new"],item:{id:"flint",count:1,components:{"minecraft:item_model":"wander:cutout"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[2.75,2.75,2.75],translation:[0,4.125,0]}}
execute if score bad_omen wander.data matches 1 run summon item_display ~ ~ ~ {Tags:["wander.cutout","new"],item:{id:"flint",count:1,components:{"minecraft:item_model":"wander:slaughterer_cutout"}},transformation:{left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[2.75,2.75,2.75],translation:[0,4.125,0]}}

execute as @n[tag=wander.cutout,tag=new] at @s rotated as @s run function wander:cutout/summon2
