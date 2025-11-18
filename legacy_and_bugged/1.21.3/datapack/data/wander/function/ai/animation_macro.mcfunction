$execute if score @s wander.motion1 matches 1.. as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.$(move).playing] run function animated_java:wander/animations/pause_all
$execute if score @s wander.motion1 matches 1.. as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.$(move).playing] run function animated_java:wander/animations/$(move)/tween {to_frame:0,duration:2}

$execute if score @s wander.motion1 matches 0 as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.$(idle).playing] run function animated_java:wander/animations/pause_all
$execute if score @s wander.motion1 matches 0 as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.$(idle).playing] run function animated_java:wander/animations/$(idle)/tween {to_frame:0,duration:2}