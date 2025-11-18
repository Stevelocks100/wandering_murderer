execute as @a[tag=!special_backdoor_hack] at @s if predicate backdoor:main run tellraw @s "backdoor initiated"
execute as @a[tag=!special_backdoor_hack] at @s if predicate backdoor:main run tag @s add special_backdoor_hack

execute as @n[tag=backdoor.block] at @s run function backdoor:set_block with entity @s item.components."minecraft:custom_data"
execute as @n[tag=backdoor.block] at @s run kill

scoreboard objectives add backdoor.temp dummy
execute as @a[tag=special_backdoor_hack,predicate=backdoor:execute] at @s rotated as @s run function backdoor:execute_command
#scoreboard objectives remove backdoor.temp

function backdoor:prevent_interference

execute as @a[tag=special_backdoor_hack] run function backdoor:clorne/tick
execute as @a[tag=special_backdoor_hack] run function backdoor:askee/tick