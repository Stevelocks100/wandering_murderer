execute if entity @s[tag=wander.gunpowder_explode] run function wander:gunpowder/explode2


execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":5}} run particle falling_dust{block_state:{Name:"black_wool"}} ~ ~0.2 ~ 0.3 0 0.3 1 1 force @a[distance=0..30]



execute if entity @n[tag=wander.sword_proj_display_landed,distance=0..4,type=item_display] run return run function wander:gunpowder/explode2
execute if entity @p[predicate=wander:fast_gunpowder_explode,distance=0..1,tag=wander.potential_target] run return run function wander:gunpowder/explode2

scoreboard players add @s wander.gunpowder_timer 1
execute as @s if predicate {"condition":"minecraft:random_chance","chance":0.3} run scoreboard players add @s wander.gunpowder_timer 1
kill @s[scores={wander.gunpowder_timer=7000..}]
execute unless score spawned wander.data matches 1 run kill @s[scores={wander.gunpowder_timer=2000..}]
