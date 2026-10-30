

# if wandering_slaughterer is in custom_model_data, that means it's wandering slaughterer
# for lowerbody, wandering_murderer means normal, wandering_slaughterer means not normal
# for hugeasssword (hand), not having blank means it's in hand, is second value.
# for hugeasssword2 (back), having wandering_murderer means sword is on back
execute on passengers if entity @s[tag=aj.wander.node.lowerbody] if data entity @s item.components."minecraft:custom_model_data"{strings:["wandering_murderer"]} on vehicle run function aj:wander/variants/slaughterer/apply
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] unless data entity @s item.components."minecraft:custom_model_data"{strings:["blank"]} on vehicle run function aj:wander/variants/sword_hand_slaughter/apply
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword2] if data entity @s item.components."minecraft:custom_model_data"{strings:["wandering_murderer"]} on vehicle run function aj:wander/variants/sword_back_slaughter/apply

execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword2] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true

execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] unless data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value false
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword2] unless data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value false


# execute as @n[tag=aj.wander.bone.hugeasssword2] run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true