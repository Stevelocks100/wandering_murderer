#invisible code >:3

execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/invisible/play

attribute @s movement_speed base set 1.0
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute unless entity @n[tag=wander.phase3.wall_center,distance=0..50,type=marker] run function wander:ai/pathfind_macro {target:'@n[tag=wander.phase3.wall_center,distance=0..,type=marker]'}
execute unless entity @n[tag=wander.phase3.wall_center,distance=0..50,type=marker] run tp @s @n[tag=wander.phase3.wall_center,distance=0..,type=marker]
data modify entity @s Fire set value -20s
data modify entity @n[tag=wander.hitbox,type=wandering_trader,distance=0..] Fire set value -20s

execute unless entity @p[tag=wander.target,distance=0..50] run function wander:ai/slaughter/vanish

scoreboard players add invis_timer wander.data 1
execute if score invis_timer wander.data matches 300.. run tag @p[tag=wander.target] remove wander.target
execute if score invis_timer wander.data matches 300.. run scoreboard players set invis_timer wander.data 0
execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute store result score horizontal_dist wander.data run function wander:ai/slaughter/player_horizontal_dist

execute if entity @n[type=#wander:scares_traders,distance=0..17] unless score throw_whey wander.attack_cooldown matches 1.. run function wander:ai/attacks/throw_whey
execute if entity @n[type=#wander:scares_traders,distance=0..17] unless score throw_whey wander.attack_cooldown matches 1.. run scoreboard players set throw_whey wander.attack_cooldown 20
scoreboard players remove throw_whey wander.attack_cooldown 1

#data modify entity @s NoAI set value 0b
execute if function wander:ai/underground/underground_check unless score player_height wander.temp matches -7..7 if entity @s[nbt={OnGround:1b}] run function wander:ai/slaughter/vanish

execute unless entity @n[tag=wander.phase3.wall_spawning] if score player_height wander.temp matches 5..8 if score horizontal_dist wander.data matches ..5 run return run scoreboard players set ai wander.data 22
execute unless entity @n[tag=wander.phase3.wall_spawning] if score player_height wander.temp matches 9.. if score horizontal_dist wander.data matches ..12 run return run scoreboard players set ai wander.data 22

execute if score @s wander.motion1 matches 0 positioned ~ ~1 ~ unless entity @p[tag=wander.target,distance=0..2.6] run scoreboard players add not_moving wander.data 1
execute unless score @s wander.motion1 matches 0 if score not_moving wander.data matches 1.. run scoreboard players remove not_moving wander.data 2
execute if score not_moving wander.data matches 120.. run function wander:ai/slaughter/vanish


execute if entity @p[tag=wander.target,distance=0..10] unless entity @n[tag=wander.phase3.wall_spawning] run function wander:ai/slaughter/reappear
execute if entity @p[tag=wander.target,distance=0..10] if entity @n[tag=wander.phase3.wall_spawning] run function wander:ai/slaughter/vanish
execute if score start_phase3 wander.data matches 1 unless entity @n[tag=wander.phase3.wall_spawning] run function wander:ai/slaughter/phase3_appear


execute if predicate {"condition":"minecraft:random_chance","chance":0.02} run function wander:random_sound
execute if predicate {"condition":"minecraft:any_of","terms":[{"condition":"minecraft:random_chance","chance":0.07},{"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":90}}]} run particle entity_effect{color:[.96471, .96471, .96471, 0.7]} ~ ~2 ~ 0.7 0.7 0.7 0 3 normal @a

execute if predicate {"condition":"minecraft:random_chance","chance":0.001} run function wander:ai/slaughter/vanish



execute if predicate {"condition":"minecraft:random_chance","chance":0.01} run function wander:ai/slaughter/cutout
execute if score 33%health wander.data matches -1 if predicate {"condition":"minecraft:random_chance","chance":0.09} run function wander:ai/slaughter/cutout
stopsound @a hostile wander:wandering_murderer.fake_stereo
stopsound @a hostile wander:wandering_murderer.fake_mono

