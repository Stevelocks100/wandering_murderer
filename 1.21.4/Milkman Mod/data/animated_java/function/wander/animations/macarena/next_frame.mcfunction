# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute if score @s aj.macarena.frame matches 165.. run scoreboard players set @s aj.macarena.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.macarena.frame
execute at @s run function animated_java:wander/animations/macarena/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.macarena.frame 1