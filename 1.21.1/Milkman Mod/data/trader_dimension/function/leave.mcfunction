execute in minecraft:overworld at @n[tag=aj.wander.locator.chest] run tp @s ~ ~ ~
attribute @s generic.scale base set 0.05
scoreboard players set $strength player_motion.api.launch 10000
execute rotated ~ -12 run function player_motion:api/launch_looking
function wander:grow_init
