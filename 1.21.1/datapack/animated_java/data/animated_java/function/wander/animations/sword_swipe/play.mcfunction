# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
tag @s add aj.wander.animation.sword_swipe.playing
scoreboard players set @s aj.sword_swipe.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:wander/animations/sword_swipe/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only