execute if predicate {"type":"minecraft:entity_properties","entity":"this","predicate":{"passenger":{"vehicle":{"entity_type":"minecraft:happy_ghast"}}}} run return 1
execute positioned ~-1 ~-2 ~-1 if entity @n[type=happy_ghast,dx=1,dy=1,dz=1,distance=0..30] run return 1

return 0
