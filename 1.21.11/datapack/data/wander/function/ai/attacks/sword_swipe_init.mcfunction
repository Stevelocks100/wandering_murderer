execute if predicate {"condition":"minecraft:random_chance","chance":0.2} run tag @s add wander.break_shield

execute at @s facing entity @p eyes run tp @s ~ ~ ~ ~ 0
execute at @s facing entity @p eyes run tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0

scoreboard players set attack_ai wander.data 1
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute unless entity @s[tag=wander.slaughterer] as @n[tag=aj.wander.root] run function animated_java:wander/animations/sword_swipe/tween {to_frame:0,duration:2}
execute if entity @s[tag=wander.slaughterer] as @n[tag=aj.wander.root] run function animated_java:wander/animations/sword_swipe/tween {to_frame:9,duration:2}

scoreboard players set attack_duration wander.data 23
execute if entity @s[tag=wander.slaughterer] run scoreboard players set attack_duration wander.data 14
data modify entity @s NoAI set value 1b

scoreboard players set sword wander.attack_cooldown 60
execute if entity @s[tag=wander.slaughterer] run scoreboard players set sword wander.attack_cooldown 40

execute if score ai wander.data matches 23 run scoreboard players set sword wander.attack_cooldown 10
execute if score ai wander.data matches 21 run scoreboard players set sword wander.attack_cooldown 10