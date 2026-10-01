execute if entity @s[tag=milk.crate_explode] at @s run function milk:crate/explode
execute if predicate wander:on_ground run tag @s add milk.crate_explode
execute if score @s milk.dropped matches 1 run particle lava ~0.2 ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a
execute if score @s milk.dropped matches 2 run particle lava ~-0.2 ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a
execute if score @s milk.dropped matches 3 run particle lava ~ ~2 ~0.2 0.1 0.1 0.1 0.1 1 normal @a
execute if score @s milk.dropped matches 4 run particle lava ~ ~2 ~-0.2 -0.1 0.1 0.1 0.1 1 normal @a
