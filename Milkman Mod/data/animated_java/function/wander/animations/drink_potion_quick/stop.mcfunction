# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
tag @s remove aj.wander.animation.drink_potion_quick.playing
scoreboard players set @s aj.drink_potion_quick.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:wander/animations/drink_potion_quick/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only