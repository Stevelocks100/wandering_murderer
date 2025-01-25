execute unless block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {move:'sneak_walk',idle:'sneak_idle'}
execute if block ~ ~ ~ #wander:water_ish run function wander:ai/animation_macro {move:'swim',idle:'angry_idle'}

execute if data entity @s wander_target run attribute @s movement_speed base set 1.0
execute unless data entity @s wander_target run attribute @s movement_speed base set 0.0
execute if function wander:ai/stalk/is_target_looking run attribute @s movement_speed base set 0.0
#execute if function wander:ai/stalk/are_nearby_players_looking run attribute @s movement_speed base set 0.0


execute unless entity @p[tag=wander.target,distance=0..30] unless function wander:ai/stalk/is_target_looking run scoreboard players set spawn_search_method wander.data 2
execute unless entity @p[tag=wander.target,distance=0..30] unless function wander:ai/stalk/is_target_looking as @p[tag=wander.target] at @s run function wander:spawn_search/init
execute if entity @n[tag=wander.spawn_pos] run function wander:ai/pathfind_macro {target:'@n[tag=wander.spawn_pos]'}
execute if entity @n[tag=wander.spawn_pos,distance=0..2] at @n[tag=wander.spawn_pos] run tp @s ~ ~ ~ ~ ~
execute if entity @n[tag=wander.spawn_pos,distance=0..2] run kill @n[tag=wander.spawn_pos]

execute if data entity @s wander_target run scoreboard players set 0.impatient wander.data 0
execute unless data entity @s wander_target if entity @p[tag=wander.target,distance=0..30] unless function wander:ai/stalk/is_target_looking run scoreboard players add 0.impatient wander.data 1
execute unless data entity @s wander_target if entity @p[tag=wander.target,distance=0..15] unless function wander:ai/stalk/is_target_looking run scoreboard players add ai wander.data 5

execute if score 0.impatient wander.data matches 800.. if entity @p[tag=wander.target,distance=0..30] run scoreboard players set ai wander.data 5

execute if entity @p[distance=0..10,tag=wander.target] if function wander:ai/stalk/is_target_looking run scoreboard players set standoff wander.data 60
execute if entity @p[distance=0..10,tag=wander.target] if function wander:ai/stalk/is_target_looking run scoreboard players set ai wander.data 1

execute if entity @p[distance=0..8,tag=!wander.target,tag=wander.potential_target] run scoreboard players set standoff wander.data 60
execute if entity @p[distance=0..8,tag=!wander.target,tag=wander.potential_target] run scoreboard players set ai wander.data 1
execute if entity @p[distance=0..8,tag=!wander.target,tag=wander.potential_target] run tag @p[distance=0..18,tag=!wander.target,tag=wander.potential_target] add wander.new_target
execute if entity @p[distance=0..8,tag=!wander.target,tag=wander.potential_target] run tag @a remove wander.target
execute if entity @p[distance=0..8,tag=!wander.target,tag=wander.potential_target] run tag @p[distance=0..18,tag=!wander.target,tag=wander.potential_target] add wander.target

scoreboard players add 0.existance wander.data 1
execute if score 0.existance wander.data matches 3000.. run function wander:ai/stalk/drink_potion
execute if score 0.existance wander.data matches 3000.. run scoreboard players set ai wander.data -1

execute if function wander:ai/stalk/is_target_looking run scoreboard players set 0.stared wander.data 1


execute unless entity @p[tag=wander.target,distance=0..60] if score 0.stared wander.data matches 0 run function wander:ai/stalk/drink_potion
execute unless entity @p[tag=wander.target,distance=0..60] if score 0.stared wander.data matches 0 run scoreboard players set ai wander.data -1

execute unless entity @p[tag=wander.target,distance=0..50] if score 0.stared wander.data matches 0 if score follow_chance wander.temp matches 0 store result score follow_chance wander.temp run random value 1..10
execute unless entity @p[tag=wander.target,distance=0..50] if score 0.stared wander.data matches 0 if score follow_chance wander.temp matches 1..3 run scoreboard players set ai wander.data 5


execute unless entity @p[tag=wander.target,distance=0..35] if score 0.stared wander.data matches 1 run scoreboard players set ai wander.data 20


tag @p[tag=wander.target] add tower.player

execute if entity @p[tag=tower.success] run scoreboard players set ai wander.data 20
execute if entity @p[tag=tower.success] run scoreboard players set tick tower.temp 0
execute if entity @p[tag=tower.success] run scoreboard players set tower_amount tower.temp 0
execute if entity @p[tag=tower.success] run tag @a remove tower.success