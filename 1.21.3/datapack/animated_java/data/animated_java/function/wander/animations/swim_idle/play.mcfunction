# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
tag @s add aj.wander.animation.swim_idle.playing
scoreboard players set @s aj.swim_idle.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:wander/animations/swim_idle/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only