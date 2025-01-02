function wander:ai/setup

execute unless dimension overworld run function wander:existance/remove
execute unless score ai wander.data matches 30.. unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target,distance=0..50] add wander.target

execute unless score ai wander.data matches 1 run scoreboard players set dance_chance wander.data 0
execute unless score ai wander.data matches 1 if score dance_chance wander.data matches 0 store result score dance_chance wander.data run random value 1..40


#normal stalk = 0
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 0 run function wander:ai/stalk/0
#stand-off = 1
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 1 run function wander:ai/stalk/1

#follow = 5
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 5 unless entity @s[tag=wander.follow_success] run function wander:ai/follow/5

execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 20 unless score jump_tick wander.data matches -11.. run function wander:ai/attack/20
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 21 unless score jump_tick wander.data matches -11.. run function wander:ai/attack/21

execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 29 run function wander:ai/29
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 30 run function wander:ai/give_sword/30
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 31 run function wander:ai/give_sword/31
execute unless score attack_ai wander.data matches 1.. if score ai wander.data matches 32 run function wander:ai/give_sword/32


execute if score jump_tick wander.data matches -11.. run function wander:ai/jump/main
execute if score attack_ai wander.data matches 1.. run function wander:ai/attacks/tick

execute store result score hitbox_health wander.data run data get entity @n[tag=wander.hitbox] Health
execute unless score hitbox_health wander.data matches 1024 run scoreboard players set 1024 wander.data 1024
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation 1024 wander.data -= hitbox_health wander.data
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation health wander.data -= 1024 wander.data
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation 1024 wander.data *= 10 wander.data
execute unless score hitbox_health wander.data matches 1024 run scoreboard players operation timer wander.data -= 1024 wander.data
execute unless score hitbox_health wander.data matches 1024 run data modify entity @n[tag=wander.hitbox] Health set value 1024.0f

execute if score health wander.data matches ..0 if score ai wander.data matches 19..25 run scoreboard players set timer wander.data 0
#0..4 = stalk-related behaviour

#5..9 = follow

#10..19 = attacks

#20..29 = attacking/running at player


#30 = give sword

execute if score ai wander.data matches 4..28 if entity @s[nbt={OnGround:1b}] if score timer wander.data matches ..0 run function wander:ai/despawn
execute if score ai wander.data matches 0..28 if entity @s[nbt={OnGround:1b}] if score daytime wander.data matches -300..0 run function wander:ai/despawn
execute if score ai wander.data matches 0..28 if entity @s[nbt={OnGround:0b}] if score daytime wander.data matches -400..-301 run function wander:ai/despawn

execute if score ai wander.data matches 0..28 unless entity @p[tag=wander.potential_target] if entity @s[nbt={OnGround:1b}] run function wander:ai/despawn


execute unless entity @n[tag=wander.sword_proj_display] if entity @s[tag=wander.threw_sword] run tag @s remove wander.threw_sword



execute store result score player_height wander.temp run data get entity @p[tag=wander.target] Pos[1]
execute store result score trader_height wander.temp run data get entity @s Pos[1]

scoreboard players operation player_height wander.temp -= trader_height wander.temp
execute if score attack_ai wander.data matches 4 if score player_height wander.temp matches -2..2 if score ai wander.data matches 21 run scoreboard players set attack_ai wander.data 0
