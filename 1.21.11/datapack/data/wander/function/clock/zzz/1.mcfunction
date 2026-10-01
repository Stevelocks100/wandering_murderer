# Generated with MC-Build

$execute if items entity @s weapon.mainhand compass[item_model="wander:clock"] run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"minecraft:lodestone_tracker":{"target":{"pos":$(stand_pos),"dimension":"minecraft:overworld"},"tracked":false}}}
$execute if items entity @s weapon.offhand compass[item_model="wander:clock"] run item modify entity @s weapon.offhand {"function":"minecraft:set_components","components":{"minecraft:lodestone_tracker":{"target":{"pos":$(stand_pos),"dimension":"minecraft:overworld"},"tracked":false}}}