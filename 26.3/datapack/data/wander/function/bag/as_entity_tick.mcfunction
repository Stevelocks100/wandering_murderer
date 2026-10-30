scoreboard players add @s wander.from_bag_timer 1
tag @s[scores={wander.from_bag_timer=1000..}] remove wander.from_bag




execute unless entity @s[type=tnt] run return 0
execute store result score tnt_fuse wander.temp run data get entity @s fuse
execute if score tnt_fuse wander.temp matches 1 run function wander:bag/tnt_explode