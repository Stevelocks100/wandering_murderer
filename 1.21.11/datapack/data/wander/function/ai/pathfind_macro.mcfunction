
$execute unless entity $(target) at @s run return run particle flame ~ ~10 ~ 0.5 2 0.5 0 10 normal @a[tag=wander.debug]

#tellraw @a[tag=wander.debug] "not exist $(target)"
data remove entity @s wander_target
data modify entity @s wander_target set value [I;0,0,0]
$execute store result entity @s wander_target[0] int 1 run data get entity $(target) Pos[0]
$execute store result entity @s wander_target[1] int 1 run data get entity $(target) Pos[1]
$execute store result entity @s wander_target[2] int 1 run data get entity $(target) Pos[2]