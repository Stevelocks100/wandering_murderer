# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute if score @s aj.sword_swipe.frame matches 24.. run scoreboard players set @s aj.sword_swipe.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.sword_swipe.frame
execute at @s run function animated_java:wander/animations/sword_swipe/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.sword_swipe.frame 1