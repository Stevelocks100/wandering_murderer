scoreboard players set ai wander.data -2
data modify entity @s NoAI set value 1b
attribute @s movement_speed base set 0
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/drink_potion_slow/tween {to_frame:0,duration:3}
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute unless entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_back/apply
execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_none/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/invis_on/apply