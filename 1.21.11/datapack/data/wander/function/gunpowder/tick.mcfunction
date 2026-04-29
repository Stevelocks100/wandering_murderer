execute store result score gunpowder_count wander.data if entity @e[tag=wander.gunpowder]


execute if score gunpowder_count wander.data matches ..400 as @e[tag=wander.gunpowder_proj] at @s run particle falling_dust{block_state:{Name:"black_wool"}} ~ ~0.2 ~ 0.3 0.3 0.3 1 10 normal @a[distance=0..30]
execute if score gunpowder_count wander.data matches ..400 as @e[tag=wander.gunpowder_proj] at @s run summon armor_stand ~ ~ ~ {Tags:["wander.gunpowder"],Invisible:1b,Invulnerable:1b,Small:1b,DisabledSlots:4144959,Silent:1b}

execute as @e[tag=wander.gunpowder] at @s run particle falling_dust{block_state:{Name:"black_wool"}} ~ ~0.2 ~ 0.3 0 0.3 1 1 force @a[distance=0..30]
execute as @n[tag=wander.sword_proj_display_landed] at @s as @n[tag=wander.gunpowder,distance=0..4] at @s run function wander:gunpowder/explode2
scoreboard players add @e[tag=wander.gunpowder] wander.gunpowder_timer 1
execute as @e[tag=wander.gunpowder] if predicate {"condition":"minecraft:random_chance","chance":0.3} run scoreboard players add @s wander.gunpowder_timer 1
kill @e[tag=wander.gunpowder,scores={wander.gunpowder_timer=9000..}]
execute unless score spawned wander.data matches 1 run kill @e[tag=wander.gunpowder,scores={wander.gunpowder_timer=2000..}]
execute as @e[tag=wander.gunpowder] at @s if entity @p[predicate=wander:fast_gunpowder_explode,distance=0..1,tag=wander.potential_target] run function wander:gunpowder/explode2
