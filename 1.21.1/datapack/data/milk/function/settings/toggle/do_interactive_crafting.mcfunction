summon marker ~ ~ ~ {Tags:["milk.settings.schedule_marker"]}
schedule function milk:settings/marker 1t
execute if score do_interactive_crafting milk.settings matches 1 run return run scoreboard players set do_interactive_crafting milk.settings -1
execute if score do_interactive_crafting milk.settings matches -1 run return run scoreboard players set do_interactive_crafting milk.settings 1