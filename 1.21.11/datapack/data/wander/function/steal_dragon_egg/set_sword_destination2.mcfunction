# hopefully this works to make sure it doesn't go out of range in case obsidian pillar is mysteriously gone.

execute unless predicate {"condition":"minecraft:location_check","predicate":{"position":{"x":{"min":-100,"max":100},"z":{"min":-100,"max":100}}}} positioned -26.5 200 -18.5 positioned over motion_blocking run return run summon marker ~ ~ ~ {Tags:["wander.sword_destination","wander.entity"]}

execute if block ~ ~ ~ #air positioned ^ ^ ^0.5 run return run function wander:steal_dragon_egg/set_sword_destination2

kill @n[tag=wander.sword_destination]
execute positioned ^ ^ ^-2 positioned over motion_blocking positioned ^ ^ ^1 run summon marker ~ ~5 ~ {Tags:["wander.sword_destination","wander.entity"]}