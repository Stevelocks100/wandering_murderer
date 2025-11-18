summon marker ~ ~ ~ {CustomName:{text:"Wandering Trader"},Tags:["wander.damage"]}
execute rotated as @s positioned ^ ^ ^3 run particle sweep_attack
execute rotated as @s positioned ^ ^ ^3 positioned ~ ~-2 ~ as @a[distance=0..3.5] run damage @s 10 mob_attack by @n[tag=wander.damage]
execute rotated as @s positioned ^ ^ ^4 positioned ~ ~2 ~ as @a[distance=0..3] run damage @s 10 mob_attack by @n[tag=wander.damage]

playsound item.trident.throw hostile @a[distance=0..16] ~ ~ ~ 1.0 0.25 0.0
kill @e[tag=wander.damage]

execute if score ai wander.data matches 21 at @p[tag=wander.target] run function wander:tower_collapse/get_tower_bottom
execute if score ai wander.data matches 21 at @n[tag=wander.tower_bottom] run function wander:tower_collapse/jenga


execute if score ai wander.data matches 21 run scoreboard players operation player_height_old wander.temp = player_height wander.temp
execute if score ai wander.data matches 21 store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute if score ai wander.data matches 21 store result score trader_height wander.temp run data get entity @s Pos[1]
execute if score ai wander.data matches 21 run scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score ai wander.data matches 21 if score player_height wander.temp = player_height_old wander.temp run scoreboard players add failed_sword_swipes wander.data 1
execute if score ai wander.data matches 21 unless score player_height wander.temp = player_height_old wander.temp run scoreboard players set failed_sword_swipes wander.data 0

execute if score ai wander.data matches 22 at @n[tag=wander.ai] run function wander:tower_collapse/explode_top
execute if score ai wander.data matches 22 at @n[tag=wander.ai] align xyz run tp @n[tag=wander.ai] ~0.5 ~ ~0.5

execute if score ai wander.data matches 23 run scoreboard players set tower_explosion wander.data 1

execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^1 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^2 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy

execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^ ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^1 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^2 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy

execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^ ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^1 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^2 ^1 unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy


execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^1 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^ ^2 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy

execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^ ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^1 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^1 ^2 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy

execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^ ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^1 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
execute if score ai wander.data matches 23 as @n[tag=wander.ai] at @s rotated as @s rotated ~ 0 positioned ^-1 ^2 ^ unless block ~ ~ ~ #wander:air_ish unless block ~ ~ ~ #wander:immovable run setblock ~ ~ ~ air destroy
