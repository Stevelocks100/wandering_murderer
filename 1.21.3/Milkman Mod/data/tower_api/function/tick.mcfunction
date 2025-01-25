#For the player with a tag:
#summon an entity underneath the player at ground level. Check if it’s inside a block before teleporting back underneath the player.
#If there’s a block inside the entity, add up a value, and if it’s high enough, then the player is towering

execute as @a[tag=tower.player] at @s run function tower_api:as_player

execute unless entity @p[tag=tower.player] run kill @n[tag=tower.tester]

execute unless entity @p[tag=tower.player] unless entity @p[tag=tower.success] run scoreboard players set tick tower.temp 0
execute unless entity @p[tag=tower.player] unless entity @p[tag=tower.success] run scoreboard players set tower_amount tower.temp 0

execute if entity @p[tag=tower.success] run scoreboard players remove tick tower.temp 1
execute if entity @p[tag=tower.success] if score tick tower.temp matches ..0 run tag @p[tag=tower.success] remove tower.success



