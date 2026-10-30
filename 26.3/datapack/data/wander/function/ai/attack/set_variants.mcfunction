
#scoreboard players set change_variant wander.temp 0
#function aj:wander/as_node {name:"hugeasssword",command:'execute if data entity hugeasssword item.components."minecraft:custom_model_data"{strings:["sword_back"]} run scoreboard players set change_variant wander.temp 1'}
#function aj:wander/as_node {name:"hugeasssword",command:'execute if data entity hugeasssword item.components."minecraft:custom_model_data"{strings:["sword_hand"]} run scoreboard players set change_variant wander.temp 1'}
#execute if score change_variant wander.temp matches 1 run function aj:wander/variants/sword_none/apply

execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_back"]} on vehicle run function aj:wander/variants/sword_none/apply
execute on passengers if entity @s[tag=aj.wander.node.hugeasssword] if data entity @s item.components."minecraft:custom_model_data"{strings:["sword_hand"]} on vehicle run function aj:wander/variants/sword_none/apply
