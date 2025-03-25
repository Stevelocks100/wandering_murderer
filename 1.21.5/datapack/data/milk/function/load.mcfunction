scoreboard objectives add milk.puddle dummy
scoreboard objectives add milk.crate_progress dummy
scoreboard objectives add milk.dropped minecraft.dropped:minecraft.beetroot_soup
scoreboard objectives add milk.settings dummy
scoreboard objectives add milk.temp dummy

scoreboard players add do_music milk.settings 0
execute if score do_music milk.settings matches 0 run scoreboard players set do_music milk.settings 1
scoreboard players add do_kidnapping milk.settings 0
execute if score do_kidnapping milk.settings matches 0 run scoreboard players set do_kidnapping milk.settings 1
scoreboard players add do_interactive_crafting milk.settings 0
execute if score do_interactive_crafting milk.settings matches 0 run scoreboard players set do_interactive_crafting milk.settings 1
scoreboard players add do_griefing milk.settings 0
execute if score do_griefing milk.settings matches 0 run scoreboard players set do_griefing milk.settings 1
scoreboard players add do_digging milk.settings 0
execute if score do_digging milk.settings matches 0 run scoreboard players set do_digging milk.settings -1
scoreboard players add do_fire_spawning milk.settings 0
execute if score do_fire_spawning milk.settings matches 0 run scoreboard players set do_fire_spawning milk.settings 1
scoreboard players add do_spawning milk.settings 0
execute if score do_spawning milk.settings matches 0 run scoreboard players set do_spawning milk.settings 1
