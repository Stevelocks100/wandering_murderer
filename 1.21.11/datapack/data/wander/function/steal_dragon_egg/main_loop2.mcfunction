execute if score dragon_egg_timer wander.data matches 0 run function wander:steal_dragon_egg/summon

execute if score dragon_egg_timer wander.data matches 30..480 unless entity @n[tag=aj.wander.root] run scoreboard players set dragon_egg_timer wander.data 499

execute if score dragon_egg_timer wander.data matches 499 run function wander:existence/remove
execute if score dragon_egg_timer wander.data matches 499 run kill @n[tag=wander.sword_destination]

execute if score dragon_egg_timer wander.data matches 499 run scoreboard players set daytime wander.data -501
execute if score dragon_egg_timer wander.data matches 499 run scoreboard players set timer wander.data 0
execute if score dragon_egg_timer wander.data matches 499 run scoreboard players add dragon_egg_timer wander.data 10