function wander:ai/setup

execute unless dimension overworld unless score ai wander.data matches 40 unless score ai wander.data matches ..-1 run function wander:existence/remove
execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target,distance=0..50] add wander.target
execute if score bad_omen wander.data matches 1 unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target] add wander.target
#unless score ai wander.data matches 30..
#unless score ai wander.data matches 30..
execute unless score ai wander.data matches 1 run scoreboard players set dance_chance wander.data 0
execute unless score ai wander.data matches 1 if score dance_chance wander.data matches 0 store result score dance_chance wander.data run random value 1..20


#normal stalk = 0
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 0 run function wander:ai/stalk/0
#stand-off = 1
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 1 run function wander:ai/stalk/1

#follow = 5
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 5 unless entity @s[tag=wander.follow_success] run function wander:ai/follow/5

execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":40}} run function wander:ai/cobweb_fill

execute unless entity @s[tag=wander.slaughterer] unless score attack_ai wander.data matches 1.. if score ai wander.data matches 20 run function wander:ai/attack/20
execute unless entity @s[tag=wander.slaughterer] unless score attack_ai wander.data matches 1.. if score ai wander.data matches 21 run function wander:ai/attack/21
execute if entity @s[tag=wander.slaughterer] unless score attack_ai wander.data matches 1.. if score ai wander.data matches 20 run function wander:ai/slaughter/20
execute if entity @s[tag=wander.slaughterer] unless score attack_ai wander.data matches 1.. if score ai wander.data matches 21 run function wander:ai/slaughter/21
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 22 run function wander:ai/slaughter/22

execute unless score attack_ai wander.data matches 1.. run tag @s remove wander.break_shield

execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 24 run function wander:ai/attack/24
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 25 run function wander:ai/attack/25


execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 26 run function wander:ai/sided/26
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 27 run function wander:ai/attack/27

execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 29 run function wander:ai/29
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 30 run function wander:ai/give_sword/30
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 31 run function wander:ai/give_sword/31
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 32 run function wander:ai/give_sword/32
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 33 run function wander:ai/give_sword/33
execute if score ai wander.data matches 40 run function wander:steal_dragon_egg/40

execute if score jump_tick wander.data matches -11..99 run function wander:ai/jump/jump_forwards

execute if score jump_tick wander.data matches 100.. run function wander:ai/jump/jump_upwards

execute if score attack_ai wander.data matches 1.. run function wander:ai/attacks/tick

execute store result score hitbox_health wander.data run data get entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Health
execute unless entity @n[tag=wander.hitbox,x=0,type=wandering_trader] run scoreboard players set hitbox_health wander.data 1024
execute if score ai wander.data matches -2..-1 run scoreboard players set hitbox_health wander.data 1024

execute unless score hitbox_health wander.data matches 1024 run scoreboard players set 1024 wander.data 1024
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation 1024 wander.data -= hitbox_health wander.data



execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation damage_dealt wander.data = 1024 wander.data


execute unless score hitbox_health wander.data matches 1024 run function wander:ai/damage_cap_calculation

execute unless score bad_omen wander.data matches 1 unless score hitbox_health wander.data matches 1024 run scoreboard players operation health wander.data -= damage_dealt wander.data
execute if score bad_omen wander.data matches 1 if entity @p[tag=wander.potential_target,distance=0..60] unless score hitbox_health wander.data matches 1024 run scoreboard players operation health wander.data -= damage_dealt wander.data
execute unless score hitbox_health wander.data matches 1024 if score 1024 wander.data matches 4.. run playsound minecraft:entity.wandering_trader.hurt hostile @a[distance=0..32] ~ ~ ~ 1.0 0.5 0.0
execute unless score hitbox_health wander.data matches 1024 if score 1024 wander.data matches 6.. if predicate {"condition":"minecraft:random_chance","chance":0.06} positioned ~ ~2 ~ run function wander:drop_emeralds
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation 1024 wander.data *= 10 wander.data
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation timer wander.data -= 1024 wander.data
execute unless score hitbox_health wander.data matches 1024 run data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Health set value 1024.0f


execute if score health wander.data matches ..0 if score ai wander.data matches 19..25 if score bad_omen wander.data matches 1 unless score current_phase wander.music matches 3 run scoreboard players set health wander.data 20

execute if score health wander.data matches ..0 if score ai wander.data matches 19..25 run scoreboard players set timer wander.data -500
execute if score health wander.data matches ..0 if score ai wander.data matches 19..25 if score daytime wander.data matches 4.. run scoreboard players set daytime wander.data 3
execute if score bad_omen wander.data matches 1 if score health wander.data matches ..0 if score ai wander.data matches 19..25 as 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f on attacker at @s run advancement grant @a[distance=0..40,tag=wander.potential_target] only wander:story/kill_slaughterer
execute unless score bad_omen wander.data matches 1 if score health wander.data matches ..0 if score ai wander.data matches 19..25 as 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f on attacker at @s run advancement grant @a[distance=0..40,tag=wander.potential_target] only wander:story/kill_murderer

#0..4 = stalk-related behaviour

#5..9 = follow

#10..19 = attacks

#20..29 = attacking/running at player


#30 = give sword

#aka if probably in an attacking state and active, despawn if timer has expired. (and on ground)
execute if score ai wander.data matches 4..28 if entity @s[predicate=wander:on_ground] unless score daytime wander.data matches -501 if score timer wander.data matches ..0 run function wander:ai/despawn

#if already gone, despawn when on ground
execute if score ai wander.data matches 0..28 if entity @s[predicate=wander:on_ground] if score daytime wander.data matches -300..0 run function wander:ai/despawn

#if he never lands on ground, despawn later™™
execute if score ai wander.data matches 0..28 if score daytime wander.data matches -400..-301 run function wander:ai/despawn

# if no player, and should be attacking, then despawn.
execute unless score bad_omen wander.data matches 1 if score ai wander.data matches 0..28 unless entity @p[tag=wander.potential_target] if entity @s[predicate=wander:on_ground] run function wander:ai/despawn

fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace nether_portal destroy

function wander:ai/change_hitbox_size

#execute unless entity @n[tag=wander.sword_proj_display] if entity @s[tag=wander.threw_sword] run tag @s remove wander.threw_sword



execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score attack_ai wander.data matches 4 if score player_height wander.temp matches -2..2 if score ai wander.data matches 21 run scoreboard players set attack_ai wander.data 0



execute if score attack_ai wander.data matches 0 if score ai wander.data matches 0..28 run data modify entity @s NoAI set value 0b

execute unless score bad_omen wander.data matches 1 if score ai wander.data matches 0..28 unless entity @p[tag=wander.potential_target,distance=0..120] run function wander:ai/drink_potion
execute unless score bad_omen wander.data matches 1 if score ai wander.data matches 0..28 unless score ai wander.data matches 25 if score daytime wander.data matches -501 run function wander:ai/drink_potion

execute if score bad_omen wander.data matches 1 run bossbar set wander:health name {"font":"wander:default","text":"\uFFF2"}
execute unless score bad_omen wander.data matches 1 run bossbar set wander:health name {"font":"wander:default","text":"\uFFF1"}
execute if score bad_omen wander.data matches 1 run bossbar set wander:health color white
execute unless score bad_omen wander.data matches 1 run bossbar set wander:health color green
bossbar set wander:health visible true
execute unless score ai wander.data matches 6..28 run bossbar set wander:health players @s
execute unless score daytime wander.data matches 1.. run bossbar set wander:health players @s

execute if score ai wander.data matches 6..28 if score daytime wander.data matches 1.. run bossbar set wander:health players @a[tag=wander.music]
execute store result bossbar wander:health value run scoreboard players get health wander.data

execute if score health wander.data <= 66%health wander.data if score ai wander.data matches 20..25 run function wander:fine_print/tick
execute if score 66%health wander.data matches -1 if score ai wander.data matches 20..25 run function wander:fine_print/tick
execute if score do_stand milk.settings matches 1 if score health wander.data <= 66%health wander.data if score ai wander.data matches 20..25 unless score daytime wander.data matches -501 unless entity @n[tag=aj.fine_print.root,x=0,type=item_display] run function wander:fine_print/spawn
