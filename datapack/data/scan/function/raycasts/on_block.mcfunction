## This function will run on every block in the area. Put whatever you want here! :)
execute unless entity @s[tag=wander.ai] align xyz positioned ~0.5 ~0.95 ~0.5 if block ~ ~ ~ crafting_table unless entity @n[tag=crafting.int,distance=0..0.3] unless entity @n[tag=crafting.int_locked,distance=0..0.3] run playsound minecraft:block.smithing_table.use block @a[distance=0..16] ~ ~ ~ 1.0 1.0 0.0
execute unless entity @s[tag=wander.ai] align xyz positioned ~0.5 ~0.95 ~0.5 if block ~ ~ ~ crafting_table unless entity @n[tag=crafting.int,distance=0..0.3] unless entity @n[tag=crafting.int_locked,distance=0..0.3] run function crafting:place

execute if entity @s[tag=wander.ai] if block ~ ~ ~ #wander:water_ish facing ~ ~ ~ at @s if score ice wander.attack_cooldown matches ..0 run function wander:ai/attacks/throw_ice_init



execute if entity @s[tag=wander.ice_proj] if block ~ ~ ~ #wander:water_ish run summon marker ~ ~ ~ {Tags:["wander.ice_spread"]}
execute if entity @s[tag=wander.ice_proj] if block ~ ~ ~ #wander:water_ish run scoreboard players add ice_spread wander.data 20
execute if entity @s[tag=wander.ice_proj_display] if block ~ ~ ~ #wander:water_ish run summon marker ~ ~ ~ {Tags:["wander.ice_spread"]}
execute if entity @s[tag=wander.ice_proj_display] if block ~ ~ ~ #wander:water_ish run scoreboard players add ice_spread wander.data 20
