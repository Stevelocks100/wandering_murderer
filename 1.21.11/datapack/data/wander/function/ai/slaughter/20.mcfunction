scoreboard players set daytime wander.data 100000

execute if entity @s[nbt={OnGround:1b}] run tag @s remove wander.big_jump
execute if block ~ ~ ~ #wander:water_blocks run tag @s remove wander.big_jump
execute if block ~ ~-1 ~ #wander:water_blocks run tag @s remove wander.big_jump

execute if entity @s[tag=wander.big_jump] run return 0
execute if entity @s[tag=wander.jump_landing] run function wander:ai/land

execute if score health wander.data < 50%health wander.data if score force_kidnap wander.data matches 0 run tag @s add wander.force_kidnap
execute if score health wander.data < 50%health wander.data if score force_kidnap wander.data matches 0 run scoreboard players set force_kidnap wander.data 1
execute if score health wander.data < 33%health wander.data run tag @s remove wander.force_kidnap
execute unless entity @p[tag=wander.potential_target,distance=0..100] run tag @s remove wander.force_kidnap

scoreboard players remove knock_back wander.attack_cooldown 1
execute store result score nearby_players wander.temp if entity @a[distance=0..5,tag=wander.potential_target]
execute if score knock_back wander.attack_cooldown matches ..0 if score nearby_players wander.temp matches 3.. run function wander:ai/attacks/knock_back

execute if score trapped_timer wander.data matches 1.. run scoreboard players remove trapped_timer wander.data 1
execute store result score not_trapped wander.data if entity @a[tag=!wander.phase3.trapped,tag=wander.potential_target,distance=0..100]
# execute store result score nearby_players wander.data if entity @a[tag=wander.potential_target,distance=0..100]

execute in wander:pocket unless entity @p[gamemode=!creative,gamemode=!spectator,distance=0..] in overworld if score 33%health wander.data matches -1 if score trapped_timer wander.data matches 1 if score not_trapped wander.data matches 0 run return run function wander:ai/slaughter/fail_to_kill

execute unless block ~ ~-0.1 ~ #wander:water_blocks if block ~ ~2.5 ~ #wander:can_pass if block ~ ~3.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~2.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
execute unless block ~ ~-0.1 ~ #wander:water_blocks unless block ~ ~3.5 ~ #wander:can_pass run function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
execute if block ~ ~-0.3 ~ #wander:water_blocks run function wander:ai/animation_macro {move:'swim',idle:'swim_idle'}

execute if score health wander.data <= 33%health wander.data run function wander:ai/slaughter/phase3

execute if score 33%health wander.data matches -1 if score health wander.data matches ..300 unless entity @n[tag=wander.phase3.wall2] \
if loaded ~-40 ~ ~-40 \
if loaded ~-40 ~ ~40 \
if loaded ~40 ~ ~40 \
if loaded ~40 ~ ~-40 \
run function wander:phase3/walls/summon_all_higher
execute if score 33%health wander.data matches -1 if score health wander.data matches ..150 unless entity @n[tag=wander.phase3.wall3] \
if loaded ~-40 ~ ~-40 \
if loaded ~-40 ~ ~40 \
if loaded ~40 ~ ~40 \
if loaded ~40 ~ ~-40 \
run function wander:phase3/walls/summon_all_higher2

scoreboard players remove punch wander.attack_cooldown 1
scoreboard players remove sword wander.attack_cooldown 1
scoreboard players remove jump wander.attack_cooldown 1
scoreboard players remove throw_whey wander.attack_cooldown 1

execute if predicate {"condition":"minecraft:random_chance","chance":0.08} unless score whey_count wander.data matches 10.. run scoreboard players add whey_count wander.data 1

scoreboard players remove attack_cd wander.data 1

function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute unless entity @n[tag=wander.phase3.wall_center,distance=0..50,type=marker] run function wander:ai/pathfind_macro {target:'@n[tag=wander.phase3.wall_center,distance=0..,type=marker]'}
execute unless entity @n[tag=wander.jimmy,distance=0..40,type=marker] run function wander:ai/pathfind_macro {target:'@n[tag=wander.jimmy,distance=0..,type=marker]'}

attribute @s movement_speed base set 1.35

execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players remove attack_cd wander.data 4
execute if entity @p[tag=wander.target,distance=0..2] run scoreboard players remove punch wander.attack_cooldown 1
execute if entity @p[tag=wander.target,distance=0..2] run scoreboard players remove sword wander.attack_cooldown 1

#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove attack_cd wander.data 1
#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove punch wander.attack_cooldown 1
#execute if entity @p[tag=wander.target,distance=0..1.5] run scoreboard players remove sword wander.attack_cooldown 1



execute if entity @p[tag=wander.target,distance=0..3] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack
execute positioned ~ ~1 ~ if entity @p[tag=wander.target,distance=0..2.8] if score attack_cd wander.data matches ..0 run function wander:ai/attack/attack
tag @s remove wander.follow_success

scoreboard players remove gunpowder wander.attack_cooldown 3
execute store result score gunpowder_count wander.data if entity @e[tag=wander.gunpowder,distance=0..40]
execute if score gunpowder_count wander.data matches ..50 if predicate {"condition":"minecraft:random_chance","chance":0.5} if entity @p[tag=wander.target,distance=10..80] if score attack_cd wander.data matches ..0 run function wander:ai/attacks/gunpowder_throw_init

execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute store result score horizontal_dist wander.data run function wander:ai/slaughter/player_horizontal_dist

execute if score player_height wander.temp matches 10.. unless function wander:ai/underground/underground_check run function wander:ai/slaughter/vanish

execute if score player_height wander.temp matches 5.. if score horizontal_dist wander.data matches ..5 run return run scoreboard players set ai wander.data 22

fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace fire

execute if entity @n[type=#wander:scares_traders,distance=0..10] run function wander:ai/attacks/throw_whey_init

#data modify entity @s NoAI set value 0b
execute if function wander:ai/underground/underground_check unless score player_height wander.temp matches -5..5 if entity @s[nbt={OnGround:1b}] run function wander:ai/slaughter/vanish

execute if entity @p[tag=wander.target,distance=100..] run tag @p[tag=wander.target] remove wander.target

execute if score @s wander.motion1 matches 0 positioned ~ ~1 ~ unless entity @p[tag=wander.target,distance=0..2.6] run scoreboard players add not_moving wander.data 1
execute unless score @s wander.motion1 matches 0 if score not_moving wander.data matches 1.. run scoreboard players remove not_moving wander.data 2

execute if function wander:ai/attack/moving_piston_check/init unless score @s wander.motion1 matches 0 run scoreboard players add not_moving wander.data 20

execute if score not_moving wander.data matches 70.. run function wander:ai/slaughter/vanish
execute unless entity @p[tag=wander.potential_target,distance=0..10000] run scoreboard players set not_moving wander.data 0

scoreboard players set timer wander.data 10000

execute if entity @p[tag=wander.target,distance=50..] run function wander:ai/slaughter/vanish

scoreboard players set invis_timer wander.data 0

