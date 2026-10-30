advancement revoke @s only wander:hit_normal_trader
execute unless score @s wander.killed_trader matches 1.. run return 0
tag @s add wander.hit_check
execute as @e[type=wandering_trader,distance=0..100] run function wander:hit_normal_trader2
tag @s remove wander.hit_check

execute if entity @n[tag=wander.hit_trader,tag=wander.hitbox] run return run tag @n[tag=wander.hit_trader] remove wander.hit_trader
execute if entity @n[tag=wander.hit_trader] if score daytime wander.data matches -500.. run return run tag @n[tag=wander.hit_trader] remove wander.hit_trader


execute if entity @n[tag=wander.hit_trader,tag=!wander.totemd] run tellraw @s ["",{color:"dark_red",italic:true,text:"Choose your next moves wisely."}]
item replace entity @n[tag=wander.hit_trader,tag=!wander.totemd] weapon.mainhand with totem_of_undying
tag @n[tag=wander.hit_trader] add wander.totemd
tag @n[tag=wander.hit_trader] remove wander.hit_trader