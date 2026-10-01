


execute on passengers if entity @s[tag=aj.wander.node.lowerbody] if data entity @s item.components."minecraft:custom_model_data"{strings:["default"]} on vehicle run function aj:wander/variants/slaughterer/apply
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back"]} on vehicle run function aj:wander/variants/sword_back_slaughter/apply
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand"]} on vehicle run function aj:wander/variants/sword_hand_slaughter/apply

execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword2] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true

execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] unless data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value false
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword2] unless data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back_slaughter"]} run data modify entity @s item.components."minecraft:enchantment_glint_override" set value false


# execute as @n[tag=aj.wander.bone.hugeasssword2] run data modify entity @s item.components."minecraft:enchantment_glint_override" set value true