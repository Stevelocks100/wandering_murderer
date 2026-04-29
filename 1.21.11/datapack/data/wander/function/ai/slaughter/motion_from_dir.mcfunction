execute store result score horizontal_dist wander.data run function wander:ai/slaughter/player_horizontal_dist

execute if score horizontal_dist wander.data matches 25.. positioned 0.0 0.0 0.0 positioned ^ ^ ^4 summon marker run function wander:ai/slaughter/motion_from_dir2
execute if score horizontal_dist wander.data matches 16..24 positioned 0.0 0.0 0.0 positioned ^ ^ ^3 summon marker run function wander:ai/slaughter/motion_from_dir2
execute if score horizontal_dist wander.data matches 8..15 positioned 0.0 0.0 0.0 positioned ^ ^ ^2 summon marker run function wander:ai/slaughter/motion_from_dir2
execute if score horizontal_dist wander.data matches ..7 positioned 0.0 0.0 0.0 positioned ^ ^ ^1 summon marker run function wander:ai/slaughter/motion_from_dir2



data modify entity @s Motion[1] set value -2.0d
