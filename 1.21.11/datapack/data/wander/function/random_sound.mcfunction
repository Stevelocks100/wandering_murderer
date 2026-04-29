execute store result score random_sound wander.data run random value 1..9

execute as @r[tag=wander.potential_target] at @s run summon marker ~ ~ ~ {Tags:["wander.random_sound"]}
execute as @n[tag=wander.random_sound] at @s run spreadplayers ~ ~ 1 50 false @s
execute as @n[tag=wander.random_sound] at @s run function wander:random_sound2