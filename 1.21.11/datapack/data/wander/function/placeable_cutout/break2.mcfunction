execute on passengers run kill @s
execute rotated as @s run particle block_crumble{block_state:{Name:"oak_planks"}} ^ ^2 ^-0.6 1 1.5 1 5 400 normal @a
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.2 1.0 0.0
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.2 1.0 0.0
playsound entity.armor_stand.break hostile @a[distance=0..32] ~ ~ ~ 1.2 1.0 0.0
loot spawn ~ ~0.1 ~ loot wander:placeable_cutout
kill @s
