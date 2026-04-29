# Generated with MC-Build

execute if entity @p[tag=wander.target] as @p[tag=wander.target] run function wander:fine_print/per_player/read
execute unless entity @p[tag=wander.target] as @p run function wander:fine_print/per_player/read
execute store result score random_index wander.fine_print run data get storage wander:fine_print current.stolen_items
execute if score random_index wander.fine_print matches 0 run return 0
execute store result storage wander:fine_print macro.random_index int 1 run scoreboard players remove random_index wander.fine_print 1
data modify storage wander:fine_print macro.index set value 0
execute if score random_index wander.fine_print matches 1.. run function wander:fine_print/zzz/7 with storage wander:fine_print macro
# execute if score index <%prefix%> matches -1 run return 0
execute if data storage wander:fine_print current.stolen_items[0] run function wander:fine_print/zzz/8 with storage wander:fine_print macro
execute if entity @p[tag=wander.target] as @p[tag=wander.target] run function wander:fine_print/per_player/write
execute unless entity @p[tag=wander.target] as @p run function wander:fine_print/per_player/write