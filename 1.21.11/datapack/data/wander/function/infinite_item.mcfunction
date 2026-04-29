
$function wander:infinite_item_offhand {item_model:"$(item_model)"}

$execute if items entity @s weapon.mainhand *[item_model="$(item_model)"] if data entity @s SelectedItem.components."minecraft:custom_data"{infinite_use:1b} run return run item modify entity @s weapon.mainhand {"function":"minecraft:set_custom_data","tag":{"infinite_use":false},"conditions":[]}
$execute if items entity @s weapon.mainhand *[item_model="$(item_model)"] unless data entity @s SelectedItem.components."minecraft:custom_data"{infinite_use:1b} run return run item modify entity @s weapon.mainhand {"function":"minecraft:set_custom_data","tag":{"infinite_use":true},"conditions":[]}
