scoreboard objectives add wander.data dummy
scoreboard objectives add wander.motion1 dummy
scoreboard objectives add wander.motion2 dummy
scoreboard objectives add wander.grow dummy
scoreboard objectives add wander.attack_cooldown dummy
scoreboard players set 10 wander.data 10
scoreboard players set -1 wander.data -1
scoreboard players set 360 wander.data 360
scoreboard objectives remove wander.temp
scoreboard objectives add wander.temp dummy
scoreboard players add defeated wander.data 0

team add wander.nocol
team modify wander.nocol collisionRule never

scoreboard objectives add wander.encounters dummy
scoreboard objectives add wander.deaths dummy

scoreboard objectives add wander.actual_deaths deathCount
