data modify entity @s NoAI set value 1b
scoreboard players set potion wander.data 1

scoreboard players set ai wander.data -1
scoreboard players set new_target wander.data 0
execute if entity @p[tag=wander.new_target] store result score new_target wander.data run random value 1..4
execute if score new_target wander.data matches 1 run tag @a remove wander.new_target

execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/pause_all
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/drink_potion_quick/tween {to_frame:0,duration:5}
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root] run function animated_java:wander/variants/invis_on/apply