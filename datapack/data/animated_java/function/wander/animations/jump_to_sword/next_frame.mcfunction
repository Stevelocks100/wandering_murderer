# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute if score @s aj.jump_to_sword.frame matches 11.. run scoreboard players set @s aj.jump_to_sword.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.jump_to_sword.frame
execute at @s run function animated_java:wander/animations/jump_to_sword/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.jump_to_sword.frame 1