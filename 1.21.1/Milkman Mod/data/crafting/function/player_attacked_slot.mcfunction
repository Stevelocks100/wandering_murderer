advancement revoke @s only crafting:player_attacked_slot

execute as @e[tag=crafting.slot,distance=0..5] if data entity @s attack run function crafting:remove_item