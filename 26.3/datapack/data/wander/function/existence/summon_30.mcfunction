execute unless dimension overworld run return 0

#scoreboard players set health wander.data 200
scoreboard players set 30.no_player wander.data 0
scoreboard players set attack_cd wander.data 20
scoreboard players set 0.existence wander.data 0
scoreboard players set 0.impatient wander.data 0
scoreboard players set 0.stared wander.data 0
scoreboard players set follow_chance wander.temp 0
scoreboard players set attack_cd wander.data 20
scoreboard players set 0.impatient wander.data 0
scoreboard players set defeated wander.data 1
playsound minecraft:entity.wandering_trader.reappeared hostile @a[distance=0..32] ~ ~ ~ 0.5 0.5 0.0

summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander"],attributes:[{id:"movement_speed",base:0.5},{id:"step_height",base:1.2},{id:"jump_strength",base:0.42},{id:"follow_range",base:128},{id:"fall_damage_multiplier",base:0.4},{id:"knockback_resistance",base:0.4}],Silent:1b,Invulnerable:1b,UUID:[I;-1414142670,-1164688258,-1957659834,805871948]}
summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol",Invulnerable:1b,UUID:[I;657428086,-151106681,-1509322801,1420348191]}
function aj:wander/summon {args:{}}
scoreboard players set ai wander.data 30
execute if entity @s[tag=wander.spawn_pos] run kill @s
tp abb5e532-ba94-447e-8b50-7b463008a14c ~ ~ ~ facing entity @p[tag=wander.target]

