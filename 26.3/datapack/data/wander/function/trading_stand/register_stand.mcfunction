forceload add ~-1 ~-1 ~1 ~1
tag @s add wander.trading_stand_found
data modify storage wander:temp stand_pos set value [I;0,0,0]
execute store result storage wander:temp stand_pos[0] int 1 run data get entity @s Pos[0]
execute store result storage wander:temp stand_pos[1] int 1 run data get entity @s Pos[1]
execute store result storage wander:temp stand_pos[2] int 1 run data get entity @s Pos[2]