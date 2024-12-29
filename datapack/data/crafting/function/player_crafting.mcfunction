advancement revoke @s only crafting:player_crafting

execute as @e[tag=crafting.int,distance=0..5] if data entity @s attack at @s run function crafting:save_items
