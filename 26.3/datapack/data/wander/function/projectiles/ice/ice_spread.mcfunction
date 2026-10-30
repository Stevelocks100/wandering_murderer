execute if score ice_spread wander.data matches 500.. run scoreboard players set ice_spread wander.data 500
tag @e[tag=wander.ice_spread,tag=new,x=0] remove new
execute as @e[tag=wander.ice_spread,tag=!new,limit=15,sort=random,x=0] at @s run function wander:ice_spread

