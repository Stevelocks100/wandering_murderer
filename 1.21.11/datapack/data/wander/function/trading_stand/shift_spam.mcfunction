execute unless entity @s[tag=wander.shift_spam] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} run scoreboard players add @s wander.shift_spam 1
execute unless entity @s[tag=wander.shift_spam] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} run tag @s add wander.shift_spam

execute if entity @s[tag=wander.shift_spam] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} if score @s wander.shift_spam matches 7 run tellraw @s "If you are truly stuck, keep sneak-spamming and you will get freed."

execute if entity @s[tag=wander.shift_spam] unless predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"type_specific":{"type":"minecraft:player","input":{"sneak":true}}}} run tag @s remove wander.shift_spam


scoreboard players add @s wander.shift_spam 0
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":13}} if score @s wander.shift_spam matches 1.. run scoreboard players remove @s wander.shift_spam 1


execute if score @s wander.shift_spam matches 15 run tp @s @n[tag=wander.trading_stand_found,distance=0..30]
execute if score @s wander.shift_spam matches 15 at @s run playsound entity.player.teleport player @s ~ ~ ~ 1.0 1.0 1.0
execute if score @s wander.shift_spam matches 15 run scoreboard players set @s wander.shift_spam 0