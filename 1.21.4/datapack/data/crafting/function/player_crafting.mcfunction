advancement revoke @s only crafting:player_crafting

execute as @e[tag=crafting.int,distance=0..5] if data entity @s attack at @s positioned ~ -64 ~ if entity @n[tag=crafting.countdown,distance=0..2] run return 0

execute as @e[tag=crafting.int,distance=0..5] if data entity @s attack at @s run function crafting:save_items
