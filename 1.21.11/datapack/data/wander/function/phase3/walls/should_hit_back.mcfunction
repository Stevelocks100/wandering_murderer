# Generated with MC-Build

execute at @n[tag=wander.phase3.wall_center,type=marker,x=0] if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"distance":{"horizontal":{"min":40,"max":48}}}} run return 1
return 0