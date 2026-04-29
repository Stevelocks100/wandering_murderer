scoreboard players set @s wander.sword 101
playsound item.mace.smash_ground hostile @a[distance=0..64] ~ ~ ~ 3.0 0.8 0.0
summon item_display ~ ~ ~ {Tags:["wander.temp","wander.jump_particles"]}
execute positioned ~ ~-1 ~ run loot replace entity @n[tag=wander.jump_particles] contents loot blockstate:get
function wander:ai/jump_vanish_particles2 with entity @n[tag=wander.jump_particles] item.components."minecraft:custom_data"
kill @n[tag=wander.jump_particles]

execute as @e[type=!#milk:command_entities,distance=0.1..5] run damage @s 10 wander:gilded_emerald_cleaver by @p