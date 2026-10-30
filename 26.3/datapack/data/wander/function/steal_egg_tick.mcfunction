execute unless score steal_egg wander.data matches -1 in the_end if entity @n[type=ender_dragon,x=0] run scoreboard players set steal_egg wander.data 1
execute if score steal_egg wander.data matches 1 if score trading_duration wander.data matches -100000.. run scoreboard players set trading_duration wander.data -1000000
execute if score daytime wander.data matches -501 if score steal_egg wander.data matches 1 in the_end unless entity @n[type=ender_dragon,x=0] if function wander:steal_dragon_egg/is_dragon_egg_spawned run function wander:steal_dragon_egg/main_loop
