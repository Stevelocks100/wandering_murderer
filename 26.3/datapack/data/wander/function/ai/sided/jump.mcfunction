execute if score jump_tick wander.data matches -11.. run return 0
execute if entity @s[tag=wander.jump_for_target] run return run function wander:ai/sided/land


execute if data entity @s {OnGround:1b} at @s run function wander:ai/jump/to_player_init

