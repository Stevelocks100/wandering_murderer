scoreboard players add @p[tag=wander.target] wander.encounters 1
kill @n[tag=wander.sword_int]
tp @e[tag=wander] ~ ~-1000 ~
kill @e[tag=wander]
function animated_java:wander/remove/all

#execute if entity @s[type=player] run return 0
scoreboard players operation new_spawn_time wander.data = timer wander.data
execute store result score new_random_time wander.data run random value 4500..10000
scoreboard players operation new_spawn_time wander.data += new_random_time wander.data
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
