# Generated with MC-Build

summon item_display ~ ~ ~ {Tags:["wander.phase3.prison","wander.new"],item:{id:"iron_ingot",count:1,components:{"minecraft:item_model":"wander:emerald_prison"}},transformation:{translation:[0,0.5,0],right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],scale:[1,1,1]},Passengers:[{id:"slime",Size:3,NoAI:1b,Silent:1b,Team:"wander.nocol",Tags:["wander.phase3.prison_hitbox"],attributes:[{id:"max_health",base:1024}],Health:1024,active_effects:[{id:"invisibility",duration:-1,show_particles:false}]}],teleport_duration:80}
ride @s mount @n[tag=wander.phase3.prison,tag=wander.new,distance=0..0.1,type=item_display]
tag @n[tag=wander.phase3.prison,tag=wander.new,distance=0..0.1,type=item_display] remove wander.new