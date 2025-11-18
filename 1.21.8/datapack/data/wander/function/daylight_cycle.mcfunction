execute store result score modulo_time wander.temp run time query daytime
execute if score modulo_time wander.temp matches 0 run scoreboard players add days_passed wander.data 1
execute if score days_passed wander.data matches 3.. run scoreboard players set daytime wander.data 2
