
execute if block ~ ~ ~ dragon_egg if block ~ ~-1 ~ bedrock run return 1
execute if block ~ ~ ~ air if block ~ ~-1 ~ bedrock run return 0


execute positioned ~ ~1 ~ run return run function wander:steal_dragon_egg/is_dragon_egg_spawned2