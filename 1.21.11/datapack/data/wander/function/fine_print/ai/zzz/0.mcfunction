# Generated with MC-Build

function wander:fine_print/to_bag
scoreboard players set ai wander.fine_print 1
execute store result score timer wander.fine_print run random value 200..400
execute if score bad_omen wander.data matches 1 store result score timer wander.fine_print run random value 50..250