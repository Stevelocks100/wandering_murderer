execute if score ice wander.attack_cooldown matches 0.. run return 0
scoreboard players set attack_ai wander.data 3
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_back/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/ice_throw/tween {to_frame:0,duration:2}
scoreboard players set attack_duration wander.data 62
data modify entity @s NoAI set value 1b
execute at @s run tp @s ~ ~ ~ facing entity @p[tag=wander.target]
scoreboard players set ice wander.attack_cooldown 100
scoreboard players remove timer wander.data 50