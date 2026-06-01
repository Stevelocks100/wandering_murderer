
execute if score ai wander.data matches 20 if score gunpowder_count wander.data matches 20.. if entity @n[tag=wander.gunpowder,distance=8..60] facing entity @n[tag=wander.gunpowder,distance=8..60] feet run function wander:projectiles/sword/summon

execute unless entity @n[tag=wander.sword_proj,type=arrow,distance=0..3] rotated as @s facing entity @p[tag=wander.target] feet run function wander:projectiles/sword/summon


scoreboard players set tick tower.temp 0
scoreboard players set tower_amount tower.temp 0

tag @a remove tower.success
tag @p[tag=wander.target] add tower.player