# Generated with MC-Build

# should only run if daytime >= 1
# wander timer
execute if score spawned wander.data matches 0 run function wander:spawning/not_spawned_tick
execute if score spawned wander.data matches 1 run function wander:spawning/spawned_tick
execute as @a[tag=wander.potential_target,x=0] at @s unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"movement":{"speed":{"min":0.2}}}} run scoreboard players add @s wander.player_not_moving 1
execute as @a[tag=wander.potential_target,x=0] at @s unless score @s wander.player_not_moving matches ..-1 if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"movement":{"speed":{"min":0.2}}}} run scoreboard players set @s wander.player_not_moving 0