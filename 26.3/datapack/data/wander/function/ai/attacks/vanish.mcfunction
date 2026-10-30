execute unless entity @s[predicate=wander:on_ground] run return 0

data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Invulnerable set value 1b

scoreboard players set attack_ai wander.data 3
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/pause_all
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/drink_potion_quick/tween {to_frame:2,duration:1}
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/invis_on/apply
scoreboard players set attack_duration wander.data 12
data modify entity @s NoAI set value 1b
