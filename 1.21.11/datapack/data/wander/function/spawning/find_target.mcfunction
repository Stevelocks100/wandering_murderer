# Generated with MC-Build

# tag @a remove wander.target
# tag @a[tag=!wander.potential_target,tag=wander.new_target] remove wander.new_target
tag @a[tag=!wander.potential_target,tag=wander.new_target] remove wander.new_target
tag @a[tag=!wander.potential_target,tag=wander.target] remove wander.target
tag @a[tag=wander.new_target] add wander.target
# gotta account for SOME of the code (not all lmao) using wander.new_target
# instead of wander.target
# already have a target.
execute if entity @p[tag=wander.target] run return run function wander:spawning/zzz/5
# now checking for players that are alone, are AFK, and/or with the lowest amount of encounters.
# all of these should be done on a scale of 0-10.
scoreboard players set @a wander.spawn.spawn_score -1
execute as @a[tag=wander.potential_target,x=0] at @s run function wander:spawning/zzz/6
# now we have a buncha values.
scoreboard players set highest_score wander.spawn.spawn_score -999
execute as @a[scores={wander.spawn.spawn_score=0..},x=0,tag=wander.potential_target] run scoreboard players operation highest_score wander.spawn.spawn_score > @s wander.spawn.spawn_score
execute as @a[scores={wander.spawn.spawn_score=0..},x=0,tag=wander.potential_target] if score @s wander.spawn.spawn_score = highest_score wander.spawn.spawn_score run tag @s add wander.new_target
tag @r[tag=wander.new_target] add wander.target
tag @a remove wander.new_target
# only select one.