scoreboard players set ai wander.data -2
data modify entity @s NoAI set value 1b
attribute @s movement_speed base set 0

execute at @s positioned over motion_blocking unless entity @s[distance=0..0.5] run tag @s remove wander.jump_despawn_anim
execute if predicate {"condition":"minecraft:random_chance","chance":0.4} at @s positioned over motion_blocking if entity @s[distance=0..0.5] run tag @s add wander.jump_despawn_anim

execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute unless entity @s[tag=wander.jump_despawn_anim] as @n[tag=aj.wander.root] run function animated_java:wander/animations/drink_potion_slow/tween {to_frame:0,duration:3}
execute if entity @s[tag=wander.jump_despawn_anim] as @n[tag=aj.wander.root] run function animated_java:wander/animations/jump_despawn/tween {to_frame:0,duration:3}

execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute unless entity @s[tag=wander.threw_sword] unless entity @s[tag=wander.sword_taken] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_back/apply
execute if entity @s[tag=wander.threw_sword] as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_none/apply
execute unless entity @s[tag=wander.jump_despawn_anim] as @n[tag=aj.wander.root] run function animated_java:wander/variants/invis_on/apply
tag @s remove wander.jump_despawn_anim