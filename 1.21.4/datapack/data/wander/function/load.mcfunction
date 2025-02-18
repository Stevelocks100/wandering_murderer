scoreboard objectives add wander.data dummy
scoreboard objectives add wander.motion1 dummy
scoreboard objectives add wander.motion2 dummy
scoreboard objectives add wander.grow dummy
scoreboard objectives add wander.attack_cooldown dummy
scoreboard players set 10 wander.data 10
scoreboard players set -1 wander.data -1
scoreboard players set 360 wander.data 360
scoreboard players set 24k wander.data 24000
scoreboard objectives remove wander.temp
scoreboard objectives add wander.temp dummy
scoreboard players add defeated wander.data 0

bossbar remove wander:health
bossbar add wander:health {"font":"wander:default","text":"\uFFF1"}
bossbar set wander:health players @s
bossbar set wander:health visible false
bossbar set wander:health color green
bossbar set wander:health max 700
bossbar set wander:health style notched_12

team add wander.nocol
team modify wander.nocol collisionRule never

scoreboard objectives add wander.encounters dummy
scoreboard objectives add wander.deaths dummy

scoreboard objectives add wander.actual_deaths deathCount
scoreboard players add dig_config wander.data 0
schedule function wander:settings_message 2s
