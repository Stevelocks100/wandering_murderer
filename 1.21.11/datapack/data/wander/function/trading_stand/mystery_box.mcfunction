particle gust
kill @s
execute if predicate {"condition":"minecraft:random_chance","chance":0.1} run return run loot spawn ~ ~ ~ loot minecraft:chests/shipwreck_treasure
execute if predicate {"condition":"minecraft:random_chance","chance":0.3} run return run loot spawn ~ ~ ~ loot minecraft:chests/abandoned_mineshaft
execute if predicate {"condition":"minecraft:random_chance","chance":0.01} run return run loot spawn ~ ~ ~ loot chests/trial_chambers/corridor
execute if predicate {"condition":"minecraft:random_chance","chance":0.15} run return run loot spawn ~ ~ ~ loot chests/village/village_armorer
execute if predicate {"condition":"minecraft:random_chance","chance":0.15} run return run loot spawn ~ ~ ~ loot minecraft:chests/simple_dungeon
execute if predicate {"condition":"minecraft:random_chance","chance":0.07} run return run loot spawn ~ ~ ~ loot chests/desert_pyramid