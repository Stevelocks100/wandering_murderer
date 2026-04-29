execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"vehicle":{"type":"minecraft:happy_ghast"}}}} run return 1
execute positioned ~-1 ~-2 ~-1 if entity @n[type=happy_ghast,dx=1,dy=1,dz=1] run return 1

return 0
