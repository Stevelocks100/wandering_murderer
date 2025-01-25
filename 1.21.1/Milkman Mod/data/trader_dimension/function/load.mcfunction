#tellraw @a {"text":"click here to teleport!","clickEvent":{"action":"run_command","value":"/execute in trader_dimension:pocket run tp @s 5 20 5"}}

#function trader_dimension:remove
#function trader_dimension:summon

##attribute @e[type=!player,limit=1] minecraft:generic.fall_damage_multiplier base set 0
scoreboard objectives remove trader_dimension.temp

scoreboard objectives add trader_dimension.temp dummy
