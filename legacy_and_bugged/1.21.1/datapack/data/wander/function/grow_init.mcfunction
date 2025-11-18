tag @s add wander.grow
attribute @s generic.scale base set 0.05
scoreboard players set @s wander.grow 0

execute if entity @n[tag=aj.wander.locator.chest] unless entity @n[tag=wander.ai] at @s run kill @n[tag=aj.wander.locator.chest]
execute if entity @n[tag=aj.wander.locator.chest] unless entity @n[tag=wander.ai] at @s run forceload remove ~ ~