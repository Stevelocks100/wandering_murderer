advancement revoke @s only wander:killed_hitbox
#scoreboard players remove health wander.data 1000
execute unless entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f run summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:5,NoAI:1b,Silent:1b,Team:"wander.nocol",UUID:[I;657428086,-151106681,-1509322801,1420348191]}

