
#if a wandering trader was killed

scoreboard players set not_moving wander.data 0

tag @s add wander.slaughterer
data modify entity @n[tag=wander.hitbox,type=wandering_trader,distance=0..] Invulnerable set value 0b
function animated_java:wander/remove/all
execute unless entity @n[tag=aj.wander.root] run function animated_java:wander/summon {args:{animation:'jump_upward',frame:10,variant:'slaughterer'}} 
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/slaughterer/apply

scoreboard players set ai wander.data 20


