data modify entity @s NoAI set value 1b

scoreboard players set ai wander.data -1
scoreboard players set new_target wander.data 0
execute if entity @p[tag=wander.new_target] store result score new_target wander.data run random value 1..4
execute if score new_target wander.data matches 1 run tag @a remove wander.new_target

data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Invulnerable set value 1b

execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/pause_all
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/drink_potion_quick/tween {to_frame:0,duration:5}
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/invis_on/apply