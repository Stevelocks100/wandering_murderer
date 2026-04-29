execute if items entity @s weapon.mainhand bow run return 0
$execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run return run item replace entity @s $(slot) with wooden_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run return run item replace entity @s $(slot) with stone_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.5} run return run item replace entity @s $(slot) with copper_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.4} run return run item replace entity @s $(slot) with iron_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.3} run return run item replace entity @s $(slot) with golden_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.2} run return run item replace entity @s $(slot) with diamond_$(tool)
$execute if predicate {"condition":"minecraft:random_chance","chance":0.05} run return run item replace entity @s $(slot) with netherite_$(tool)
