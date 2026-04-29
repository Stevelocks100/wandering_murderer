#tellraw @a {"text":"click here to teleport!","clickEvent":{"action":"run_command","value":"/execute in wander:pocket run tp @s 5 20 5"}}

#function wander:trader_dimension/remove
#function wander:trader_dimension/summon

##attribute @e[type=!player,limit=1] minecraft:fall_damage_multiplier base set 0
scoreboard objectives remove wander.trader_dimension

scoreboard objectives add wander.trader_dimension dummy
execute in wander:pocket run worldborder center 0 0
execute in wander:pocket run worldborder set 1000 0
execute in wander:pocket run worldborder warning distance 0