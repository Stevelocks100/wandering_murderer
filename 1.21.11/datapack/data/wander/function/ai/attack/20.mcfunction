
execute if entity @s[nbt={OnGround:1b}] run tag @s remove wander.jump_for_sword
execute if block ~ ~ ~ #wander:water_blocks run tag @s remove wander.jump_for_sword
execute if block ~ ~-1 ~ #wander:water_blocks run tag @s remove wander.jump_for_sword

execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root,distance=0..10] run function wander:ai/attack/set_variants


execute if entity @s[tag=wander.jump_for_sword] run return 0
execute if entity @s[tag=wander.jump_landing] run function wander:ai/land
tag @s remove wander.jump_for_target


scoreboard players remove @a wander.launch_cd 1
scoreboard players remove kidnap wander.attack_cooldown 1

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":50}} at @p[tag=wander.target] run function wander:tower_collapse/get_tower_bottom
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":50}} at @p[tag=wander.target] if entity @n[tag=wander.tower_bottom] unless entity @n[tag=wander.tower_bottom,distance=0..3] run scoreboard players set ai wander.data 21

execute if score health wander.data < 50%health wander.data if score force_kidnap wander.data matches 0 run tag @s add wander.force_kidnap
execute if score health wander.data < 50%health wander.data if score force_kidnap wander.data matches 0 run scoreboard players set force_kidnap wander.data 1
execute if score health wander.data < 33%health wander.data run tag @s remove wander.force_kidnap
execute unless entity @p[tag=wander.potential_target,distance=0..100] run tag @s remove wander.force_kidnap

execute unless block ~ ~-0.1 ~ #wander:water_blocks if entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless entity @s[tag=wander.threw_sword] if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~2.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~3.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}

execute if block ~ ~-0.3 ~ #wander:water_blocks run function wander:ai/animation_macro {move:'swim',idle:'swim_idle'}
execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function aj:wander/variants/sword_none/apply

scoreboard players remove punch wander.attack_cooldown 1
scoreboard players remove sword wander.attack_cooldown 1
scoreboard players remove throw_sword wander.attack_cooldown 1
scoreboard players remove throw_whey wander.attack_cooldown 1

execute if entity @s[tag=wander.threw_sword] run scoreboard players set sword wander.attack_cooldown 20
scoreboard players remove stew wander.attack_cooldown 1
scoreboard players remove ice wander.attack_cooldown 1
scoreboard players remove gunpowder wander.attack_cooldown 1

execute if predicate {"condition":"minecraft:random_chance","chance":0.08} unless score whey_count wander.data matches 10.. run scoreboard players add whey_count wander.data 1

scoreboard players remove attack_cd wander.data 1

function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}

attribute @s movement_speed base set 1.2

execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players remove attack_cd wander.data 4
execute if entity @p[tag=wander.target,distance=0..2] run scoreboard players remove punch wander.attack_cooldown 1
execute if entity @p[tag=wander.target,distance=0..2] run scoreboard players remove sword wander.attack_cooldown 1

#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove attack_cd wander.data 1
#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove punch wander.attack_cooldown 1
#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove sword wander.attack_cooldown 1



execute if entity @p[tag=wander.target,distance=0..3] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack
execute positioned ~ ~1 ~ if entity @p[tag=wander.target,distance=0..2.8] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack

tag @s remove wander.follow_success

execute unless entity @p[tag=tower.success] run tag @p[tag=wander.target] add tower.player
execute if entity @p[tag=tower.success] run function wander:ai/attack/attack_tower
execute if entity @s[tag=wander.threw_sword] run scoreboard players set ai wander.data 24
scoreboard players remove ice_cooldown wander.data 1

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .x_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .y_size scan_config 5
execute if score ice_cooldown wander.data matches ..0 run scoreboard players set .z_size scan_config 10
execute if score ice_cooldown wander.data matches ..0 at @p[tag=wander.target] rotated as @p[tag=wander.target] rotated ~ 0 positioned ^ ^ ^5 positioned ~-5 ~-1 ~-5 run function wander:scan/scan
execute if score water_check wander.temp matches 1 run function wander:ai/attacks/throw_ice_init

execute if score ice_cooldown wander.data matches ..0 run scoreboard players set ice_cooldown wander.data 20

execute if entity @p[tag=wander.target,distance=10..] if score attack_cd wander.data matches ..0 run function wander:ai/attacks/gunpowder_throw_init
execute store result score gunpowder_count wander.data if entity @e[tag=wander.gunpowder,distance=0..40]
execute if score throw_sword wander.attack_cooldown matches ..0 if score attack_cd wander.data matches ..0 if score gunpowder_count wander.data matches 70.. at @p[tag=wander.target] if entity @n[tag=wander.gunpowder,distance=0..4] at @s run function wander:ai/attacks/throw_sword_init
execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches 4.. unless function wander:ai/underground/underground_check if score do_griefing milk.settings matches 1 run scoreboard players set ai wander.data 21

execute if block ~ ~ ~ #minecraft:ice run function wander:ai/destroy_nearby/init

scoreboard players remove knock_back wander.attack_cooldown 1
execute store result score nearby_players wander.temp if entity @a[distance=0..5,tag=wander.potential_target]
execute if score knock_back wander.attack_cooldown matches ..0 if score nearby_players wander.temp matches 3.. run function wander:ai/attacks/knock_back


scoreboard players set failed_sword_swipes wander.data 0

execute if entity @n[type=#wander:scares_traders,distance=0..8] run function wander:ai/attacks/throw_whey_init

#data modify entity @s NoAI set value 0b
execute if function wander:ai/underground/underground_check unless score player_height wander.temp matches -5..5 if entity @s[nbt={OnGround:1b}] run scoreboard players remove timer wander.data 50

execute if entity @p[tag=wander.target,distance=100..] run tag @p[tag=wander.target] remove wander.target
execute if entity @p[tag=wander.target,distance=30..] run scoreboard players set ai wander.data 25

execute if score @s wander.motion1 matches 0 positioned ~ ~1 ~ unless entity @p[tag=wander.target,distance=0..2.6] run scoreboard players add not_moving wander.data 1
execute unless score @s wander.motion1 matches 0 if score not_moving wander.data matches 1.. run scoreboard players remove not_moving wander.data 2

execute if function wander:ai/attack/moving_piston_check/init unless score @s wander.motion1 matches 0 run scoreboard players add not_moving wander.data 20

execute if score not_moving wander.data matches 13.. run scoreboard players remove timer wander.data 100
execute if score not_moving wander.data matches 70.. if predicate {"condition":"minecraft:random_chance","chance":0.2} if score player_height wander.temp matches 1.. run scoreboard players set ai wander.data 22
execute if score not_moving wander.data matches 13.. run tag @s add wander.jump_despawn_anim
execute unless score not_moving wander.data matches 13.. run tag @s remove wander.jump_despawn_anim
execute if score not_moving wander.data matches 200.. run function wander:ai/despawn


scoreboard players set pick_up_sword_timer wander.data 0