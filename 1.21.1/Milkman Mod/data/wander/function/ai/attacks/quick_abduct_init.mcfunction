scoreboard players set attack_ai wander.data 1
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/sack/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/abduct/tween {to_frame:58,duration:2}
scoreboard players set attack_duration wander.data 46
data modify entity @s NoAI set value 1b
