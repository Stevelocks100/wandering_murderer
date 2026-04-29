execute if entity @s[tag=wander.slaughterer] run function wander:ai/attacks/gunpowder_throw_circle
playsound item.mace.smash_ground hostile @a[distance=0..64] ~ ~ ~ 3.0 0.5 0.0
summon item_display ~ ~ ~ {Tags:["wander.temp","wander.jump_particles"]}
execute positioned ~ ~-1 ~ run loot replace entity @n[tag=wander.jump_particles] contents loot blockstate:get
function wander:ai/jump_vanish_particles2_large with entity @n[tag=wander.jump_particles] item.components."minecraft:custom_data"
kill @n[tag=wander.jump_particles]

execute as @e[type=!#milk:command_entities,distance=0.1..7,type=!wandering_trader] run damage @s 8 mob_attack by @n[tag=wander.ai]

tag @s remove wander.jump_landing