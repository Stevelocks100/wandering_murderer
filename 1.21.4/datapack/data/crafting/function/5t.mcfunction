scoreboard players set .x_size scan_config 6
scoreboard players set .y_size scan_config 6
scoreboard players set .z_size scan_config 6
execute if score do_interactive_crafting milk.settings matches 1 as @a[limit=2,sort=random] at @s positioned ~-3 ~-3 ~-3 run function scan:scan
schedule function crafting:5t 5t