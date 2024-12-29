execute as @e[tag=milk.explode] at @s run function milk:explode
execute as @e[tag=milk.milk,nbt={OnGround:1b}] run tag @s add milk.explode
execute as @e[tag=milk.milk] at @s run particle lava ~ ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a


execute as @e[tag=milk.crate_explode] at @s run function milk:crate/explode
execute as @e[tag=milk.crate,nbt={OnGround:1b}] run tag @s add milk.crate_explode
execute as @e[tag=milk.crate,scores={milk.dropped=1}] at @s run particle lava ~0.2 ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a
execute as @e[tag=milk.crate,scores={milk.dropped=2}] at @s run particle lava ~-0.2 ~2 ~ 0.1 0.1 0.1 0.1 1 normal @a
execute as @e[tag=milk.crate,scores={milk.dropped=3}] at @s run particle lava ~ ~2 ~0.2 0.1 0.1 0.1 0.1 1 normal @a
execute as @e[tag=milk.crate,scores={milk.dropped=4}] at @s run particle lava ~ ~2 ~-0.2 -0.1 0.1 0.1 0.1 1 normal @a


execute as @e[tag=milk.splash] at @s run function milk:become_puddle

execute as @e[tag=milk.droplet,nbt={OnGround:1b}] run tag @s add milk.splash


execute as @e[tag=milk.puddle] at @s run function milk:puddle_tick
execute as @n[tag=milk.puddle,scores={milk.puddle=300..}] on passengers run kill @s
execute as @n[tag=milk.puddle,scores={milk.puddle=300..}] run kill @s



execute as @a[scores={milk.puddle=1..}] run scoreboard players remove @s milk.puddle 1
execute as @a[scores={milk.crate_progress=1..}] run scoreboard players remove @s milk.crate_progress 1


execute as @a[predicate=milk:offhand_crate,scores={milk.dropped=1..}] at @s run function milk:crate/store1
scoreboard players set @a[scores={milk.dropped=1..}] milk.dropped 0
 