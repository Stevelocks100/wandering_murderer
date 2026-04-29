execute at @n[tag=wander.phase3.wall_center] positioned ~ ~20 ~ run tp @s ~ ~ ~
data modify entity @s Motion set value [0.0,-1.5,0.0]
tag @s add wander.big_jump
tag @s add wander.jump_landing
execute as @n[tag=aj.wadner.root,type=item_display] run function animated_java:wander/animations/jump_upward/set_frame {frame:10}

function wander:ai/slaughter/reappear