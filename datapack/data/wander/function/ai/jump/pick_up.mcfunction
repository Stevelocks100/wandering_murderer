scoreboard players set ai wander.data 20
kill @n[tag=wander.sword_proj_display_landed]
scoreboard players set jump_tick wander.data -12
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/sword_hand/apply
tag @s remove wander.threw_sword