tag @s add wander.grow
attribute @s scale modifier add wander:escape -0.95 add_multiplied_total
scoreboard players set @s wander.grow 0

execute if entity @n[tag=aj.wander.locator.chest] unless score spawned wander.data matches 1 at @s run kill @n[tag=aj.wander.locator.chest]
execute if entity @n[tag=aj.wander.locator.chest] unless score spawned wander.data matches 1 at @s run forceload remove ~ ~