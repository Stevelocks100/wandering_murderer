execute at @s facing entity @p eyes run tp @s ~ ~ ~ ~ 0
execute at @s facing entity @p eyes run tp @n[tag=aj.wander.root] ~ ~ ~ ~ 0

scoreboard players set attack_ai wander.data 1
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/sword_swipe/tween {to_frame:0,duration:2}
scoreboard players set attack_duration wander.data 23
data modify entity @s NoAI set value 1b

scoreboard players set sword wander.attack_cooldown 30
execute if score ai wander.data matches 23 run scoreboard players set sword wander.attack_cooldown 10
execute if score ai wander.data matches 21 run scoreboard players set sword wander.attack_cooldown 10