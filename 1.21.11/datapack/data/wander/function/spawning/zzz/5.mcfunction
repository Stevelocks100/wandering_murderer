# Generated with MC-Build

execute store result score new_target_count wander.spawn if entity @a[tag=wander.target]
execute if score new_target_count wander.spawn matches 1 run return 0
# now we assume there is more than one "new target"
tag @a[tag=wander.target] add wander.new_target
tag @r[tag=wander.new_target] add wander.target
tag @a remove wander.new_target