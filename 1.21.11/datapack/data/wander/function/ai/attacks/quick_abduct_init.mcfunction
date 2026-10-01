scoreboard players set attack_ai wander.data 1
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/item_off/apply
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/variants/sack/apply
execute as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/pause_all
execute if entity @s[tag=wander.force_kidnap] as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/abduct/tween {to_frame:61,duration:2}
execute unless entity @s[tag=wander.force_kidnap] as @n[tag=aj.wander.root,type=item_display] run function aj:wander/animations/abduct/tween {to_frame:50,duration:2}
scoreboard players set attack_duration wander.data 54
execute if entity @s[tag=wander.force_kidnap] run scoreboard players remove attack_duration wander.data 11
data modify entity @s NoAI set value 1b
