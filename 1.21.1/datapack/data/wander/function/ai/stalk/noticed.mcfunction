scoreboard players set ai wander.data -1
execute store result score 0.attack_chance wander.encounters run random value 0..8
execute if score @s wander.encounters <= 0.attack_chance wander.encounters as @n[tag=wander.ai] at @s rotated as @s run function wander:ai/stalk/drink_potion
execute if score @s wander.encounters > 0.attack_chance wander.encounters run function wander:ai/to_attack
scoreboard players set timer wander.data 200