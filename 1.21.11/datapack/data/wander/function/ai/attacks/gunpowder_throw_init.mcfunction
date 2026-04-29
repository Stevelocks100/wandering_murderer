execute if score gunpowder wander.attack_cooldown matches 0.. run return 0

scoreboard players set attack_ai wander.data 3
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_back/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute unless entity @s[tag=wander.slaughterer] as @n[tag=aj.wander.root] run function animated_java:wander/animations/gunpowder_throw/tween {to_frame:0,duration:2}
execute if entity @s[tag=wander.slaughterer] as @n[tag=aj.wander.root] run function animated_java:wander/animations/gunpowder_throw/tween {to_frame:15,duration:2}


scoreboard players set attack_duration wander.data 62
execute if entity @s[tag=wander.slaughterer] run scoreboard players set attack_duration wander.data 14

data modify entity @s NoAI set value 1b
execute at @s run tp @s ~ ~ ~ facing entity @p[tag=wander.target]
scoreboard players set gunpowder wander.attack_cooldown 300
scoreboard players set throw_sword wander.attack_cooldown 70
scoreboard players remove timer wander.data 50
