scoreboard players set ai wander.data 32
execute unless entity @s[tag=wander.sword_taken] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword2.playing] run function animated_java:wander/animations/pause_all
execute unless entity @s[tag=wander.sword_taken] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword2.playing] run function animated_java:wander/animations/give_sword2/tween {to_frame:0,duration:4}
execute if entity @s[tag=wander.sword_taken] run function wander:ai/stalk/drink_potion
execute if entity @s[tag=wander.sword_taken] run scoreboard players set ai wander.data 33