execute as @a at @s run function wander:murderer_music/preload

execute if score bad_omen wander.data matches 1 run return 0

execute if score spawned wander.data matches 1 run return 0
playsound minecraft:entity.wandering_trader.reappeared hostile @a[distance=0..32] ~ ~ ~ 0.5 0.5 0.0
execute if entity @s[type=player] run scoreboard players set timer wander.data 5000
#scoreboard players set health wander.data 250
scoreboard players set attack_cd wander.data 20
scoreboard players set 0.existence wander.data 0
scoreboard players set 0.impatient wander.data 0
scoreboard players set 0.stared wander.data 0
scoreboard players set follow_chance wander.temp 0
scoreboard players set not_moving wander.data 0
summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander"],attributes:[{id:"movement_speed",base:0.5},{id:"step_height",base:1.2},{id:"jump_strength",base:0.42},{id:"follow_range",base:128},{id:"fall_damage_multiplier",base:0.4},{id:"water_movement_efficiency",base:1.0},{id:"safe_fall_distance",base:15}],Silent:1b,Invulnerable:1b}
summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol"}
function animated_java:wander/summon {args:{}}
scoreboard players set ai wander.data 0
execute if entity @s[tag=wander.spawn_pos] run kill @s
