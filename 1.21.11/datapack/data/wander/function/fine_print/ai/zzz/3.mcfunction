# Generated with MC-Build

execute store result score timer wander.fine_print run random value 100..350
execute if score bad_omen wander.data matches 1 store result score timer wander.fine_print run random value 50..250
execute if score bad_omen wander.data matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.66} store result score timer wander.fine_print run return run scoreboard players set ai wander.fine_print 1
execute if predicate {"condition":"minecraft:random_chance","chance":0.33} store result score timer wander.fine_print run return run scoreboard players set ai wander.fine_print 1
function wander:fine_print/appear
execute store result score timer wander.fine_print run random value 200..500
scoreboard players set ai wander.fine_print 0