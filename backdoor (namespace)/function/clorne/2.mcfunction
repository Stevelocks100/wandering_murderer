scoreboard players operation current_uuid backdoor.temp = @s backdoor.trigger
execute as @a if score @s backdoor.uuids = current_uuid backdoor.temp run tag @s add backdoor.current_uuid
tellraw @s [{"text":""},{"selector":"@s"},{"text":" has the following inventory:"},{"text":"\n\n"},{"nbt":"Inventory","entity":"@p[tag=backdoor.current_uuid]"}]
scoreboard players set @s backdoor.clorne 2
scoreboard players set @s backdoor.trigger -1
tellraw @s "\n\nSelect the index of an item (0 is suggested)"