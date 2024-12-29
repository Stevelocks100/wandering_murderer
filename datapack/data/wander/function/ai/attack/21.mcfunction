execute if entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run',idle:'angry_idle'}
execute unless entity @s[tag=wander.threw_sword] run function wander:ai/animation_macro {move:'angry_run_sword',idle:'angry_idle'}

scoreboard players remove sword wander.attack_cooldown 1

scoreboard players remove attack_cd wander.data 1

attribute @s generic.movement_speed base set 1.3



execute as @n[tag=wander.tower_bottom] at @s facing entity @n[tag=wander.ai] feet rotated ~ 0 positioned ^ ^ ^2 run tp @n[tag=wander.tower_bottom_target] ~ ~ ~

function wander:ai/pathfind_macro {target:'@n[tag=wander.tower_bottom_target]'}
execute unless entity @n[tag=wander.tower_bottom_target,distance=0..2.7] at @p[tag=wander.target] positioned ~ ~-2 ~ run function wander:tower_collapse/get_tower_bottom
execute if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 run tp @s ~ ~ ~ facing entity @n[tag=wander.tower_bottom]
execute if entity @n[tag=wander.tower_bottom_target,distance=0..2.7] if score sword wander.attack_cooldown matches ..0 run function wander:ai/attacks/sword_swipe_init


execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches -10..3 run scoreboard players set ai wander.data 20


execute if score failed_sword_swipes wander.data matches 3.. run function wander:ai/attacks/throw_sword_init