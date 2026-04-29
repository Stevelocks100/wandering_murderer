execute positioned 8.5 62.0 6.5 positioned over motion_blocking positioned ~ ~10 ~ run function wander:existence/summon_revenge
scoreboard players set ai wander.data 40
scoreboard players set daytime wander.data 99999
scoreboard players set timer wander.data 999999
data modify entity @n[tag=wander.hitbox,type=wandering_trader,distance=0..] Invulnerable set value 1b
execute positioned 0 62 0 run playsound wander:wandering_murderer.phase1 hostile @a[distance=0..] ~ ~ ~ 1.0 1.0 1.0
scoreboard players set dragon_egg_timer wander.data 2

function wander:steal_dragon_egg/set_sword_destination

execute in the_end positioned 0.0 0 0.0 positioned over motion_blocking unless block ~ ~-1 ~ dragon_egg align xyz positioned ~0.5 ~0.5 ~0.5 run summon item_display ~ ~ ~ {Tags:["wander.dragon_egg"],item:{id:"dragon_egg",count:1}}
execute in the_end positioned 0.0 0 0.0 positioned over motion_blocking positioned ~ ~-1 ~ if block ~ ~ ~ dragon_egg align xyz positioned ~0.5 ~0.5 ~0.5 run summon item_display ~ ~ ~ {Tags:["wander.dragon_egg"],item:{id:"dragon_egg",count:1}}

execute positioned 0.0 0 0.0 positioned over motion_blocking positioned ~ ~-1 ~ if block ~ ~ ~ dragon_egg run setblock ~ ~ ~ air strict