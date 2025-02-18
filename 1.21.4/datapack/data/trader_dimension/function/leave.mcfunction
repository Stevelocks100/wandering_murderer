execute in minecraft:overworld at @n[tag=aj.wander.locator.chest] run tp @s ~ ~ ~
attribute @s scale base set 0.05
scoreboard players set $strength player_motion.api.launch 10000
execute rotated ~ -12 run function player_motion:api/launch_looking
effect give @s slow_falling 5 0 true
function wander:grow_init
