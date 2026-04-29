execute as @a at @s run function wander:murderer_music/preload

#if a wandering trader was killed
function wander:reset_values
#execute if entity @s[tag=wander.ai] run return run function wander:existence/summon_slaughterer_from_29
execute if score spawned wander.data matches 1 run return 0
execute store result score bad_omen_strength wander.data run data get entity @s active_effects[{id:"minecraft:bad_omen"}].amplifier 5
effect clear @s bad_omen
execute if entity @s[type=player] run scoreboard players set timer wander.data 7000
scoreboard players set daytime wander.data 1000
scoreboard players set health wander.data 600



execute store result score health_mult wander.data if entity @a[tag=wander.potential_target]
scoreboard players set additional_health wander.temp 150
scoreboard players operation health_mult wander.data *= additional_health wander.temp
scoreboard players operation health wander.data += health_mult wander.data

scoreboard players operation bad_omen_health wander.temp = health wander.data
scoreboard players operation bad_omen_health wander.temp *= bad_omen_strength wander.data
scoreboard players set 10 wander.data 10
scoreboard players operation bad_omen_health wander.temp /= 10 wander.data
scoreboard players operation health wander.data += bad_omen_health wander.temp

scoreboard players set bad_omen wander.data 1
scoreboard players set 33 wander.data 33
scoreboard players set 100 wander.data 100
scoreboard players operation 33%health wander.data = health wander.data
scoreboard players operation 33%health wander.data *= 33 wander.data
scoreboard players operation 33%health wander.data /= 100 wander.data
scoreboard players operation 66%health wander.data = 33%health wander.data
scoreboard players operation 66%health wander.data += 33%health wander.data

scoreboard players set 5 wander.data 5
scoreboard players operation bad_omen_strength wander.data /= 5 wander.data

execute store result bossbar wander:health max run scoreboard players get health wander.data

execute if entity @s[type=player,tag=wander.potential_target] run tag @s add wander.target
#scoreboard players set health wander.data 250
scoreboard players set not_moving wander.data 0

summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander","wander.big_jump","wander.jump_landing","wander.slaughterer"],attributes:[{id:"movement_speed",base:0.5},{id:"step_height",base:1.2},{id:"jump_strength",base:0.42},{id:"follow_range",base:128},{id:"fall_damage_multiplier",base:0.4},{id:"water_movement_efficiency",base:1.0},{id:"safe_fall_distance",base:15}],Silent:1b,Invulnerable:1b,Motion:[0.0,-1.5,0.0]}
summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol"}
function animated_java:wander/summon {args:{animation:'jump_upward',frame:10,variant:'slaughterer'}}



scoreboard players set ai wander.data 20
execute if entity @s[tag=wander.spawn_pos] run kill @s

