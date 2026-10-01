execute unless dimension the_end unless dimension overworld run return 0
#if a wandering trader was killed
execute if score spawned wander.data matches 1 run return 0

scoreboard players set fishing_spawn wander.data 1
execute if predicate {"condition":"minecraft:random_chance","chance":0.1} if score cutout_cooldown wander.data matches ..0 if entity @p[scores={wander.encounters=1..}] as @p[tag=wander.potential_target,x=0] at @s run return run function wander:cutout/random_summon
execute if predicate {"condition":"minecraft:random_chance","chance":0.5} if score new_spawn_time wander.data matches ..20000 run return run function wander:fishing_jumpscare3
scoreboard players set fishing_spawn wander.data 0

scoreboard players set timer wander.data 2500
execute if entity @s[type=player,tag=wander.potential_target] run tag @s add wander.target
#scoreboard players set health wander.data 250
scoreboard players set not_moving wander.data 0

summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander","wander.jump_for_sword","wander.jump_landing"],attributes:[{id:"movement_speed",base:0.5},{id:"step_height",base:1.2},{id:"jump_strength",base:0.42},{id:"follow_range",base:128},{id:"fall_damage_multiplier",base:0.4},{id:"water_movement_efficiency",base:1.0},{id:"safe_fall_distance",base:15},{id:"knockback_resistance",base:0.4}],Silent:1b,Invulnerable:1b,UUID:[I;-1414142670,-1164688258,-1957659834,805871948]}
summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol",UUID:[I;657428086,-151106681,-1509322801,1420348191]}
function aj:wander/summon {args:{animation:'jump_upward',frame:10}}
scoreboard players set ai wander.data 22

scoreboard players set 22_jump wander.data 19

scoreboard players set ice wander.attack_cooldown 200
scoreboard players set gunpowder wander.attack_cooldown 200
scoreboard players set throw_sword wander.attack_cooldown 200


execute if entity @s[tag=wander.spawn_pos] run kill @s

