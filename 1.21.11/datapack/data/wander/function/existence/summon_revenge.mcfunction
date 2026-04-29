
#if a wandering trader was killed
execute if score spawned wander.data matches 1 run return 0
execute if entity @s[type=player] run scoreboard players set timer wander.data 7000
execute if entity @s[type=player,tag=wander.potential_target] run tag @s add wander.target
#scoreboard players set health wander.data 250
scoreboard players set not_moving wander.data 0

summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander","wander.jump_for_sword","wander.jump_landing"],attributes:[{id:"movement_speed",base:0.5},{id:"step_height",base:1.2},{id:"jump_strength",base:0.42},{id:"follow_range",base:128},{id:"fall_damage_multiplier",base:0.4},{id:"water_movement_efficiency",base:1.0},{id:"safe_fall_distance",base:15}],Silent:1b,Invulnerable:1b,Motion:[0.0,-1.5,0.0]}
summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol"}
function animated_java:wander/summon {args:{animation:'jump_upward',frame:10}}
scoreboard players set ai wander.data 20
execute if entity @s[tag=wander.spawn_pos] run kill @s

