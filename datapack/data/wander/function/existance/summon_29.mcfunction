execute if entity @n[tag=wander.ai] run return 0

scoreboard players set health wander.data 500
scoreboard players set attack_cd wander.data 20
scoreboard players set 0.existance wander.data 0
scoreboard players set 0.impatient wander.data 0
scoreboard players set 0.stared wander.data 0
scoreboard players set follow_chance wander.temp 0
$execute positioned $(x) $(y) $(z) run summon wandering_trader ~ ~ ~ {Tags:["wander.ai","wander"],attributes:[{id:"generic.movement_speed",base:0.5},{id:"generic.step_height",base:1.2},{id:"generic.jump_strength",base:0.42},{id:"generic.follow_range",base:9999},{id:"generic.fall_damage_multiplier",base:0.4},{id:"generic.water_movement_efficiency",base:1.0}],Silent:1b,Invulnerable:1b}
$execute positioned $(x) $(y) $(z) run summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"generic.scale",base:2},{id:"generic.max_health",base:1024}],NoGravity:1b,Health:1024,NoAI:1b,Silent:1b,Team:"wander.nocol"}
$execute positioned $(x) $(y) $(z) run function animated_java:wander/summon {args:{}}
$execute positioned $(x) $(y) $(z) run forceload add ~ ~
scoreboard players set ai wander.data 29
execute if entity @s[tag=wander.spawn_pos] run kill @s

