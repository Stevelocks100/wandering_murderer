$execute positioned ~ $(pos) ~ as @e[tag=crafting.slot_locked,limit=9,sort=nearest] run tag @s add crafting.slot
$execute positioned ~ $(pos) ~ as @e[tag=crafting.slot_locked,limit=9,sort=nearest] run data remove entity @s attack
$execute positioned ~ $(pos) ~ as @e[tag=crafting.slot_locked,limit=9,sort=nearest] run data remove entity @s interaction
$execute positioned ~ $(pos) ~ as @e[tag=crafting.slot_locked,limit=9,sort=nearest] run tag @s remove crafting.slot_locked
$execute positioned ~ $(pos) ~ as @n[tag=crafting.int_locked] run tag @s add crafting.int
$execute positioned ~ $(pos) ~ as @n[tag=crafting.int_locked] run data remove entity @s attack
$execute positioned ~ $(pos) ~ as @n[tag=crafting.int_locked] run data remove entity @s interaction
$execute positioned ~ $(pos) ~ as @n[tag=crafting.int_locked] run tag @s remove crafting.int_locked


execute unless data block ~ -64 ~-1 Items[0] run return 0
$execute positioned ~ $(pos) ~ as @e[tag=crafting.slot,limit=9,sort=nearest] on passengers run data remove entity @s item
