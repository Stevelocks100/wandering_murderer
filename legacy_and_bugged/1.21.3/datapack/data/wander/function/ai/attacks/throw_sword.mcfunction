
execute rotated as @s facing entity @p[tag=wander.target] feet run function wander:projectiles/sword/summon


scoreboard players set tick tower.temp 0
scoreboard players set tower_amount tower.temp 0

tag @a remove tower.success
tag @p[tag=wander.target] add tower.player