execute if score daytime wander.data matches -501 if score spawned wander.data matches 0 run return 0

data modify storage wander:temp debug set value []

data modify storage wander:temp debug set value ["Daytime: ",{underlined:true,score:{name:"daytime",objective:"wander.data"}},", Last Hit: ",{underlined:true,selector:"@p[tag=wander.last_hit]"}]
execute if score daytime wander.data matches 1.. run data modify storage wander:temp debug set value ["Timer: ",{underlined:true,score:{name:"timer",objective:"wander.data"}}," < ",{underlined:true,score:{name:"new_spawn_time",objective:"wander.data"}},", Daytime: ",{underlined:true,score:{name:"daytime",objective:"wander.data"}},", Target: ",{underlined:true,selector:"@p[tag=wander.new_target]"}]
execute if entity @n[tag=wander.ai,x=0,type=wandering_trader] run function wander:ai/debug_text_spawned
execute in overworld if entity @n[tag=aj.fine_print.root,x=0] run function wander:ai/debug_text_fine_print
title @s times 0 20 5
title @s actionbar {storage:"wander:temp",nbt:"debug",interpret:true}


execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":200}} run title @s title ""
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"periodic_tick":200}} run title @s subtitle ""