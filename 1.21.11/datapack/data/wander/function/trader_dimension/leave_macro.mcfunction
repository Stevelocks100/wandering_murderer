$execute in minecraft:overworld run tp @s $(x) $(y) $(z)
attribute @s scale modifier add wander:escape -0.95 add_multiplied_total
scoreboard players set $strength player_motion.api.launch 10000
execute rotated ~ -12 run function player_motion:api/launch_looking
effect give @s slow_falling 5 0 true
function wander:grow_init
scoreboard players set attack_cd wander.data 150