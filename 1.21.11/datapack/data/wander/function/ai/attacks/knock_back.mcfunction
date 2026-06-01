scoreboard players set knock_back wander.attack_cooldown 400
function wander:ai/attacks/gunpowder_throw_circle
playsound item.mace.smash_ground hostile @a[distance=0..64] ~ ~ ~ 3.0 0.5 0.0
summon item_display ~ ~ ~ {Tags:["wander.temp","wander.jump_particles"]}
execute positioned ~ ~-1 ~ run loot replace entity @n[tag=wander.jump_particles] contents loot blockstate:get
function wander:ai/jump_vanish_particles2_large with entity @n[tag=wander.jump_particles] item.components."minecraft:custom_data"
kill @n[tag=wander.jump_particles]

scoreboard players set $strength player_motion.api.launch -15000
execute as @a[tag=wander.potential_target,distance=0..6] at @s facing entity @n[tag=wander.ai,type=wandering_trader,distance=0..10] feet rotated ~ 30 run function player_motion:api/launch_looking
effect give @s slowness 5 50 true