execute unless entity @s[nbt={OnGround:1b}] run return 0

data modify entity @n[tag=wander.hitbox,type=wandering_trader,distance=0..] Invulnerable set value 1b

scoreboard players set attack_ai wander.data 3
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/drink_potion_quick/tween {to_frame:2,duration:1}
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/invis_on/apply
scoreboard players set attack_duration wander.data 12
data modify entity @s NoAI set value 1b
