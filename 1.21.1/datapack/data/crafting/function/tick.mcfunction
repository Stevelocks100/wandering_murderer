execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown] run scoreboard players add @s crafting.temp 1
execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=2}] at @s run setblock ~ -64 ~1 redstone_block
execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=7}] at @s run function crafting:remove_recipe_items with entity @s data

execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=7}] at @s run function crafting:summon_item
execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=9..}] at @s run setblock ~ -64 ~ bedrock
execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=9..}] at @s run setblock ~ -64 ~1 bedrock
execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=9..}] at @s run setblock ~ -64 ~-1 bedrock

execute if score do_interactive_crafting milk.settings matches 1 as @e[tag=crafting.countdown,scores={crafting.temp=9..}] run kill @s


execute as @e[tag=crafting.int,limit=10,sort=random] at @s unless block ~ ~ ~ crafting_table run function crafting:remove_this
execute if score do_interactive_crafting milk.settings matches 1 as @a[scores={crafting.placed=1..}] at @s run function crafting:table_scan
scoreboard players reset @a crafting.placed