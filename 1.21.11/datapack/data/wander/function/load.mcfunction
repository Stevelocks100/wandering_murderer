## WANDER UUIDS

## AI:
# abb5e532-ba94-447e-8b50-7b463008a14c
# replaced all @n[tag=wander.ai]
# [I;-1414142670,-1164688258,-1957659834,805871948]

## HITBOX:
# 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f
# replaced all @n[tag=wander.hitbox,type=wandering_trader,x=0]
# [I;657428086,-151106681,-1509322801,1420348191]


scoreboard objectives add wander.data dummy
scoreboard objectives add wander.motion1 dummy
scoreboard objectives add wander.motion2 dummy
scoreboard objectives add wander.grow dummy
scoreboard objectives add wander.attack_cooldown dummy
scoreboard players set 6 wander.data 6
scoreboard players set 10 wander.data 10

scoreboard players set -1 wander.data -1
scoreboard players set 360 wander.data 360
scoreboard players set 24k wander.data 24000
scoreboard objectives remove wander.temp
scoreboard objectives add wander.temp dummy
scoreboard players add defeated wander.data 0
scoreboard objectives add wander.gunpowder_timer dummy
scoreboard objectives add wander.cutout_timer dummy
scoreboard objectives add wander.sword dummy
scoreboard objectives add wander.from_bag_timer dummy
scoreboard objectives add wander.damage_dealt custom:damage_dealt
scoreboard objectives add wander.trader_damage_dealt dummy
scoreboard objectives add wander.launch_cd dummy
scoreboard players add trading_stand_spawned wander.data 0
scoreboard objectives add wander.rotation_velocity dummy
scoreboard objectives add wander.quaternion dummy
scoreboard objectives add wander.amethyst_sword_cd dummy
scoreboard objectives add wander.whey dummy
scoreboard objectives add wander.shift_spam dummy
scoreboard objectives add wander.placed_armor_stand minecraft.used:minecraft.armor_stand

scoreboard players set pickle_magic wander.data 0
execute if function wander:magic_integration/magic_installed run scoreboard players set pickle_magic wander.data 1

execute unless score daytime wander.data = daytime wander.data run scoreboard players set daytime wander.data -501

execute unless data storage wander:trades offers run function wander:trading_stand/create_trades
scoreboard players add trading_stand_found wander.data 0

scoreboard objectives add wander.player_not_moving dummy
#bossbar remove wander:health
bossbar add wander:health {"font":"wander:default","text":"\uFFF1"}
bossbar set wander:health players @s
bossbar set wander:health visible false
bossbar set wander:health color green
#bossbar set wander:health max 700
bossbar set wander:health style notched_12

execute unless score daytime wander.data = daytime wander.data run scoreboard players set daytime wander.data -501

scoreboard players set placed_pocket wander.data 0

team add wander.nocol
team modify wander.nocol collisionRule never

scoreboard objectives add wander.encounters dummy
scoreboard objectives add wander.deaths dummy

scoreboard objectives add wander.actual_deaths deathCount
scoreboard players add dig_config wander.data 0
#schedule function wander:settings_message 2s

forceload add -1 -1 1 1

data modify storage wander:temp jump_heights set value {1: 0.368129d, 2: 0.544852d, 3: 0.684757d, 4: 0.803191d, 5: 0.909661d, 6: 1.007461d, 7: 1.098668d, 8: 1.184765d, 9: 1.265948d, 10: 1.343341d, 11: 1.418117d, 12: 1.490527d, 13: 1.559598d, 14: 1.627379d, 15: 1.692982d, 16: 1.756867d, 17: 1.819609d, 18: 1.88038d, 19: 1.94055d, 20: 1.998827d, 21: 2.056673d, 22: 2.112952d, 23: 2.168689d, 24: 2.22337d, 25: 2.277183d, 26: 2.330591d, 27: 2.382645d, 28: 2.434698d, 29: 2.485483d, 30: 2.53592d, 31: 2.586046d, 32: 2.634993d, 33: 2.68394d, 34: 2.732198d, 35: 2.779768d, 36: 2.827338d, 37: 2.87407d, 38: 2.920364d, 39: 2.966657d, 40: 3.01215d, 41: 3.057258d, 42: 3.102366d, 43: 3.146863d, 44: 3.190866d, 45: 3.234869d, 46: 3.278576d, 47: 3.321548d, 48: 3.364519d, 49: 3.407491d, 50: 3.449619d}
scoreboard objectives add wander.killed_trader dummy


#phase3 is mcb, and i dont wanna put it in load tag.
function wander:phase3/load

function wander:fine_print/load

execute in wander:pocket run forceload add -80 -80 80 80

function wander:trader_dimension/load

function wander:jukebox_animation/load

function wander:murderer_music/load

function wander:lazy_tick

function wander:spawning/load

