execute if entity @s[tag=milk.explode] run function milk:explode
execute if predicate wander:on_ground run tag @s add milk.explode
particle lava ~ ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a
