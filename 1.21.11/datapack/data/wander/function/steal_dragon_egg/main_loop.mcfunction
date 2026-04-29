#scoreboard players add dragon_egg_timer wander.data 1
scoreboard players add dragon_egg_timer wander.data 0
scoreboard players set steal_egg wander.data -1
execute in the_end run function wander:steal_dragon_egg/main_loop2
execute if score dragon_egg_timer wander.data matches 500.. run return run scoreboard players set dragon_egg_timer wander.data 0
schedule function wander:steal_dragon_egg/main_loop 1t