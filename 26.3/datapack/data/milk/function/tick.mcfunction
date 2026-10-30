# function milk:milk_schedule
# function milk:puddle_schedule


execute as @a[scores={milk.puddle=1..}] run scoreboard players remove @s milk.puddle 1
execute as @a[scores={milk.crate_progress=1..}] run scoreboard players remove @s milk.crate_progress 1


execute as @a[predicate=milk:offhand_crate,scores={milk.dropped=1..}] at @s run function milk:crate/store1
scoreboard players set @a[scores={milk.dropped=1..}] milk.dropped 0
 