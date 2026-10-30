scoreboard players add dig_config wander.data 1
execute if score dig_config wander.data matches 2.. run scoreboard players set dig_config wander.data 0
execute if score do_digging milk.settings matches 1 run tellraw @s "Digging enabled"
execute if score dig_config wander.data matches 0 run tellraw @s "Digging disabled"