#d = mod (abs (t1 - t2), 360)

#if (d > 180)
#    d = 360 - d
#
#if (d <= 10)

#input:
#scoreboard for current rot
#score for desired rot
#threshold (amount of error) in scoreboard

#current rot
#desired rot
#thred hold
$scoreboard players operation current wander.temp = $(current)
$scoreboard players operation desired wander.temp = $(desired)
$scoreboard players set threshold wander.temp $(threshold)

scoreboard players add current wander.temp 180
scoreboard players add desired wander.temp 180

scoreboard players operation delta wander.temp = current wander.temp
scoreboard players operation delta wander.temp -= desired wander.temp
execute if score delta wander.temp matches ..-1 run scoreboard players operation delta wander.temp *= -1 wander.data
scoreboard players operation delta wander.temp %= 360 wander.data
scoreboard players operation 360 wander.temp = delta wander.temp
execute if score delta wander.temp matches 181.. run scoreboard players operation 360 wander.temp = 360 wander.data
execute if score delta wander.temp matches 181.. run scoreboard players operation 360 wander.temp -= delta wander.temp
#tellraw @p {"score":{"name":"360","objective":"wander.temp"}}

execute if score 360 wander.temp <= threshold wander.temp run return 1
return 0
#scoreboard objectives add wander.temp dummy
