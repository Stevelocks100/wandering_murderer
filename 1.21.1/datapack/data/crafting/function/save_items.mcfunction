#setblock ~ -64 ~1 redstone_block
setblock ~ -64 ~ crafter[orientation=north_up]
setblock ~ -64 ~-1 barrel
summon marker ~ -64 ~ {Tags:["crafting.countdown","new"]}
data modify entity @n[tag=new,tag=crafting.countdown] data.pos set from entity @s Pos[1]



execute as @e[tag=crafting.slot,limit=9,sort=nearest] run tag @s add crafting.slot_locked
execute as @e[tag=crafting.slot,limit=9,sort=nearest] run tag @s remove crafting.slot

tag @n[tag=new,tag=crafting.countdown] remove new
data remove entity @s attack
execute on passengers run data remove entity @s data.items
execute at @s as @n[tag=crafting.slot1] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot1] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 0b
execute at @s as @n[tag=crafting.slot1] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot2] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot2] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 1b
execute at @s as @n[tag=crafting.slot2] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot3] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot3] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 2b
execute at @s as @n[tag=crafting.slot3] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot4] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot4] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 3b
execute at @s as @n[tag=crafting.slot4] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot5] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot5] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 4b
execute at @s as @n[tag=crafting.slot5] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot6] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot6] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 5b
execute at @s as @n[tag=crafting.slot6] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot7] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot7] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 6b
execute at @s as @n[tag=crafting.slot7] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot8] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot8] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 7b
execute at @s as @n[tag=crafting.slot8] on passengers run tag @s remove crafting.selected_slot

execute at @s as @n[tag=crafting.slot9] on passengers run tag @s add crafting.selected_slot
execute on passengers run data modify entity @s data.items append from entity @n[tag=crafting.selected_slot] item
execute at @s as @n[tag=crafting.slot9] on passengers if data entity @s item as @n[tag=crafting.int] on passengers run data modify entity @s data.items[-1].Slot set value 8b
execute at @s as @n[tag=crafting.slot9] on passengers run tag @s remove crafting.selected_slot



execute on passengers run data modify block ~ -64 ~ Items set from entity @s data.items


tag @s add crafting.int_locked
tag @s remove crafting.int