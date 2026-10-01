
# "is spawned" scoreboard checks
execute store result score spawned wander.data if entity abb5e532-ba94-447e-8b50-7b463008a14c
execute if entity abb5e532-ba94-447e-8b50-7b463008a14c if score ai wander.data matches 20..21 store result score bad_omen wander.data if entity @n[tag=wander.slaughterer]
execute if score bad_omen wander.data matches 1 run scoreboard players set spawned wander.data 1
execute if score daytime wander.data matches -501 unless entity abb5e532-ba94-447e-8b50-7b463008a14c if score bad_omen wander.data matches 1 run scoreboard players set bad_omen wander.data 0

scoreboard players remove cutout_cooldown wander.data 1
execute if score cutout_cooldown wander.data matches ..0 if entity @p[scores={wander.encounters=1..}] if score daytime wander.data matches 1.. if predicate {"condition":"minecraft:random_chance","chance":0.00008} unless score spawned wander.data matches 1 unless entity @n[tag=wander.cutout,x=0] as @r[tag=wander.potential_target,x=0] at @s run function wander:cutout/random_summon

execute as abb5e532-ba94-447e-8b50-7b463008a14c at @s rotated as @s run function wander:ai/as_root



function wander:spawning/tick


# tower resetting
execute unless entity @n[tag=wander.tower_detection] unless entity @n[tag=wander.tower_checked] run scoreboard players set active_downwards_check wander.data 0
execute unless score spawned wander.data matches 1 run tag @a remove tower.player



execute if score daytime wander.data matches 0 run title @a times 0 40 20
execute if score daytime wander.data matches 0 run title @a actionbar "You feel the threatening presense vanish..."

execute as @a if score @s wander.actual_deaths matches 1.. run scoreboard players set @s wander.attack_cooldown 100
execute as @a if score @s wander.actual_deaths matches 1.. run scoreboard players set @s wander.actual_deaths 0

function wander:dimension_players_check


execute if score daytime wander.data matches 1.. unless score spawned wander.data matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.0001} run function wander:random_sound

execute if score active_upwards_check wander.data matches 1 run function wander:tower_collapse/tree/upwards/recursive
execute if score active_upwards_check wander.data matches 1 run function wander:tower_collapse/tree/upwards/recursive
