scoreboard players set attack_ai wander.data 1
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/punch/tween {to_frame:0,duration:2}
scoreboard players set attack_duration wander.data 23
data modify entity @s NoAI set value 1b
scoreboard players set punch wander.attack_cooldown 60