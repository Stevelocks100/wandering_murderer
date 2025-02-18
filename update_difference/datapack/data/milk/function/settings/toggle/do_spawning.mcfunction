summon marker ~ ~ ~ {Tags:["milk.settings.schedule_marker"]}
schedule function milk:settings/marker 1t
execute if score do_spawning milk.settings matches 1 run return run scoreboard players set do_spawning milk.settings -1
execute if score do_spawning milk.settings matches -1 run return run scoreboard players set do_spawning milk.settings 1