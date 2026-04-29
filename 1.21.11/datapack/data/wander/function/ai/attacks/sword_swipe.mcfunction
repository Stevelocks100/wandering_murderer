
particle sweep_attack
execute positioned ~ ~1 ~ as @a[distance=0..2.5] run tag @s add wander.do_damage
execute as @a[distance=0..2.5] run tag @s add wander.do_damage
execute positioned ~ ~1.5 ~ as @a[distance=0..1.5] run tag @s add wander.do_damage

execute positioned ~ ~1.5 ~ as @n[type=happy_ghast,distance=0..8] run damage @s 6 wander:gilded_emerald_cleaver_wander by @n[tag=wander.ai]

execute at @n[tag=wander.ai] rotated as @n[tag=wander.ai] rotated ~ 0 positioned ^ ^ ^1 as @a[distance=0..3] run tag @s add wander.do_damage
execute as @a[tag=wander.do_damage] run damage @s 9 wander:gilded_emerald_cleaver_wander by @n[tag=wander.ai]

tag @a[tag=wander.do_damage] remove wander.do_damage

playsound item.trident.throw hostile @a[distance=0..16] ~ ~ ~ 1.0 0.25 0.0


execute if predicate {"condition":"minecraft:random_chance","chance":0.08} if score bad_omen wander.data matches 1 run function wander:ai/attacks/amethyst_sword_effect

execute if score ai wander.data matches 21 at @p[tag=wander.target] run function wander:tower_collapse/get_tower_bottom
execute if score ai wander.data matches 21 at @n[tag=wander.tower_bottom] run function wander:tower_collapse/jenga


execute if score ai wander.data matches 21 run scoreboard players operation player_height_old wander.temp = player_height wander.temp
execute if score ai wander.data matches 21 store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute if score ai wander.data matches 21 store result score trader_height wander.temp run data get entity @s Pos[1]
execute if score ai wander.data matches 21 run scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score ai wander.data matches 21 if score player_height wander.temp >= player_height_old wander.temp run scoreboard players add failed_sword_swipes wander.data 1
execute if score ai wander.data matches 21 if score player_height wander.temp < player_height_old wander.temp run scoreboard players remove failed_sword_swipes wander.data 1
execute if score failed_sword_swipes wander.data matches ..-1 run scoreboard players set failed_sword_swipes wander.data 0