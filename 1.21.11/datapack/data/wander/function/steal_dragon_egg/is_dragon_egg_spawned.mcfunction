# if the end fountain does NOT exist, it will cause absurd amounts of lag.
# so instead it uses that super cool clone strategy to check if it's spawned or been placed.
execute in minecraft:the_end positioned 0 0 0 unless loaded ~ ~ ~ run return 0
return run execute in the_end run clone 0 0 0 0 255 0 0 0 0 filtered dragon_egg force

# this recursion checks for bedrock, THEN dragon egg.
#execute in minecraft:the_end positioned 0 0 0 run return run function wander:steal_dragon_egg/is_dragon_egg_spawned2