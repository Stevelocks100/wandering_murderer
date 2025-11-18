advancement revoke @s only crafting:player_interacted_slot

execute as @e[tag=crafting.slot,distance=0..5] if data entity @s interaction run function crafting:add_item