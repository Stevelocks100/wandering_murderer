execute unless entity @s[nbt={OnGround:1b}] run return 0
execute if score throw_whey wander.attack_cooldown matches 1.. run return 0
execute unless score whey_count wander.data matches 1.. run return 0

scoreboard players set attack_ai wander.data 3
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root,tag=!wander.threw_sword] run function animated_java:wander/variants/sword_back/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/whey_throw/tween {to_frame:15,duration:2}
scoreboard players set attack_duration wander.data 22
execute if entity @s[tag=wander.slaughterer] run scoreboard players set attack_duration wander.data 14
data modify entity @s NoAI set value 1b
execute unless entity @n[type=#wander:scares_traders,distance=0..17] at @s run tp @s ~ ~ ~ facing entity @p[tag=wander.target]
execute if entity @n[type=#wander:scares_traders,distance=0..17] at @s run tp @s ~ ~ ~ facing entity @n[type=#wander:scares_traders,distance=0..17]

scoreboard players set throw_whey wander.attack_cooldown 5
scoreboard players remove timer wander.data 50