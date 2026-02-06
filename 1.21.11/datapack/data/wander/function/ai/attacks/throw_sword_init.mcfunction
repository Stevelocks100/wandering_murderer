scoreboard players set attack_ai wander.data 4
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/sword_throw/tween {to_frame:0,duration:2}
scoreboard players set attack_duration wander.data 62
data modify entity @s NoAI set value 1b
tag @s add wander.threw_sword
scoreboard players set throw_sword wander.attack_cooldown 50
scoreboard players set failed_sword_swipes wander.data 0