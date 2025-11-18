#execute if score manhunt_goal wander.data matches 1 run time set 6000t
execute if score manhunt_goal wander.data matches 0 run return 0

#Not normally accessible
#Players must reach 1000 blocks away from the starting point to win. Normally at 0 0
#it’s a radius instead of a square
#Once that’s done, the traders onslaught ends
#Players respawn at another random players position. 
execute as @a at @s rotated as @s run function manhunt_goal:distance_check
execute if score daytime wander.data matches 100..200 run scoreboard players add daytime wander.data 2000
execute if score manhunt_goal wander.data matches 1 run schedule function manhunt_goal:tick 1t

execute if score daytime wander.data matches ..-100 run scoreboard players set manhunt_goal wander.data 0