# Generated with MC-Build

execute if score timer wander.data matches ..-10000 run scoreboard players set timer wander.data -500
execute if score new_spawn_time wander.data matches ..-10000 run scoreboard players set new_spawn_time wander.data 3000
execute if score timer wander.data matches 50000.. run scoreboard players set timer wander.data 4000
execute if score new_spawn_time wander.data matches 50000.. run scoreboard players set new_spawn_time wander.data 5000
scoreboard players set spawn_search_method wander.data 1
scoreboard players add timer wander.data 1
execute in overworld unless entity @p[x=0,tag=wander.potential_target] in wander:pocket if entity @p[x=0] run scoreboard players add timer wander.data 4
execute as @a[tag=wander.potential_target,x=0,scores={wander.player_not_moving=100..}] run scoreboard players add timer wander.data 2
# creating spawn positions. no clue why this is so spread out from the actual spawning.
execute if score timer wander.data > new_spawn_time wander.data if score timer wander.data matches 4000.. run function wander:spawning/zzz/0
execute if score trying_to_spawn wander.data matches 1 as @n[tag=wander.spawn_pos,type=item_display,x=0] at @s run function wander:spawning/zzz/1