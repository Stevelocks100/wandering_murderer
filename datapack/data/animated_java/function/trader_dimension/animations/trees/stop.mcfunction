# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
tag @s remove aj.trader_dimension.animation.trees.playing
scoreboard players set @s aj.trees.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:trader_dimension/animations/trees/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only