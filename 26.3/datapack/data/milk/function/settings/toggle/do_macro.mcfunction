summon marker ~ ~ ~ {Tags:["milk.settings.schedule_marker"]}
schedule function milk:settings/marker 1t

$execute if score $(setting) milk.settings matches 1 run return run scoreboard players set $(setting) milk.settings -1
$execute if score $(setting) milk.settings matches -1 run return run scoreboard players set $(setting) milk.settings 1