# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
scoreboard players remove @s aj.tween_duration 1
execute if score @s aj.tween_duration matches 1.. run return 1
execute if score @s aj.tween_duration matches 0 on passengers run data modify entity @s interpolation_duration set value 1
execute if score @s aj.sneak_idle.frame matches -1 run function animated_java:wander/animations/sneak_idle/zzz/zzz/0
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.sneak_idle.frame
function animated_java:wander/animations/sneak_idle/zzz/apply_frame with storage aj:temp
execute if score @s aj.sneak_idle.frame matches 71.. run return run function animated_java:wander/animations/sneak_idle/zzz/zzz/1
scoreboard players add @s aj.sneak_idle.frame 1