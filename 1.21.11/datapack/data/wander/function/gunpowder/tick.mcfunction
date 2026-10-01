execute store result score gunpowder_count wander.data in overworld if entity @e[tag=wander.gunpowder,x=0]
execute if score gunpowder_count wander.data matches 0 store result score gunpowder_count wander.data in overworld if entity @e[tag=wander.gunpowder_proj,x=0]

execute if score gunpowder_count wander.data matches 0 run return 0

# run as gunpowder projectiles instead
execute if score gunpowder_count wander.data matches ..400 as @e[tag=wander.gunpowder_proj,type=snowball,x=0] at @s if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":1}} run function wander:gunpowder/as_projectile
execute as @e[tag=wander.gunpowder,type=armor_stand,x=0] at @s run function wander:gunpowder/as_gunpowder
