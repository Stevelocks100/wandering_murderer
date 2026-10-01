
execute store result score dimension wander.temp in wander:pocket if entity @a[x=0]
execute store result score overworld wander.temp in overworld if entity @a[x=0,tag=wander.potential_target]
execute if score spawned wander.data matches 1 run return 0
execute unless score bad_omen wander.data matches 1 if score overworld wander.temp matches 0 if score dimension wander.temp matches 1.. unless entity abb5e532-ba94-447e-8b50-7b463008a14c run function wander:existence/summon_29 with storage wander:temp kidnap_pos