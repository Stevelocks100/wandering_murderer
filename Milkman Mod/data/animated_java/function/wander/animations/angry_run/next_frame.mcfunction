# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute if score @s aj.angry_run.frame matches 12.. run scoreboard players set @s aj.angry_run.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.angry_run.frame
execute at @s run function animated_java:wander/animations/angry_run/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.angry_run.frame 1