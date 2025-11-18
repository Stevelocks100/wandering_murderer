tellraw @s "Select a player to continue:"
execute at @s as @a run tellraw @p [{"text":""},{"selector":"@s"},{"text":": "},{"nbt":"UUID[0]","entity":"@s","color":"gold"}]
scoreboard players set @s backdoor.trigger 0
scoreboard players set @s backdoor.clorne 1