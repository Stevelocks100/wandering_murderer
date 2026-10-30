
scoreboard players operation timer wander.data = new_spawn_time wander.data
execute if score timer wander.data matches ..4000 run scoreboard players set timer wander.data 4000
execute unless entity @p[tag=wander.target,x=0] run tag @p[tag=wander.potential_target,distance=0..40] add wander.target
schedule function wander:fishing_jumpscare4 5s