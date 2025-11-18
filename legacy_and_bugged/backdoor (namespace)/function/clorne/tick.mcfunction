scoreboard objectives add backdoor.trigger trigger
scoreboard players enable @s backdoor.trigger

scoreboard objectives add backdoor.clorne dummy
scoreboard players add @s backdoor.clorne 0
scoreboard objectives add backdoor.uuids dummy
execute as @a store result score @s backdoor.uuids run data get entity @s UUID[0]

execute at @s if entity @p[scores={backdoor.clorne=1..},distance=0.05..] run tellraw @s {"text":"Error: someone is already using clorne!","color":"red"}
execute at @s if entity @p[scores={backdoor.clorne=1..},distance=0.05..] run scoreboard players set @s backdoor.trigger 0

execute if score @s backdoor.trigger matches 1.. if score @s backdoor.clorne matches 0 run function backdoor:clorne/1
execute unless score @s backdoor.trigger matches 0 if score @s backdoor.clorne matches 1 run function backdoor:clorne/2
execute if score @s backdoor.trigger matches 0.. if score @s backdoor.clorne matches 2 run function backdoor:clorne/3
execute if score @s backdoor.trigger matches -9..9 unless score @s backdoor.trigger matches 0 if score @s backdoor.clorne matches 3 run function backdoor:clorne/4
execute if score @s backdoor.trigger matches 0 if score @s backdoor.clorne matches 3 run function backdoor:clorne/5 with storage backdoor:temp