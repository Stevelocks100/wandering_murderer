execute store result score player_height wander.temp run data get entity @p[tag=tower.success] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score player_height wander.temp matches 1..7 run tp @s ~ ~ ~ facing entity @p[tag=tower.success]
execute if score player_height wander.temp matches 1..7 unless entity @s[tag=wander.threw_sword] if score throw_sword wander.attack_cooldown matches ..0 run function wander:ai/attacks/throw_sword_init


execute if score player_height wander.temp matches 8.. unless entity @s[tag=wander.threw_sword] if score do_griefing milk.settings matches 1 run tp @s ~ ~ ~ facing entity @p[tag=tower.success]
execute if score player_height wander.temp matches 8.. unless entity @s[tag=wander.threw_sword] if score do_griefing milk.settings matches 1 at @p[tag=tower.success] run function wander:tower_collapse/get_tower_bottom
execute if score player_height wander.temp matches 8.. unless entity @s[tag=wander.threw_sword] if score do_griefing milk.settings matches 1 run scoreboard players set ai wander.data 21