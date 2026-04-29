execute store result score dimension wander.temp if entity @a[nbt={Dimension:"wander:pocket"}]
execute store result score overworld wander.temp if entity @a[nbt={Dimension:"minecraft:overworld"},tag=wander.potential_target]
execute if score spawned wander.data matches 1 run return 0
execute unless score bad_omen wander.data matches 1 if score overworld wander.temp matches 0 if score dimension wander.temp matches 1.. unless entity @n[tag=wander.ai] run function wander:existence/summon_29 with storage wander:temp kidnap_pos