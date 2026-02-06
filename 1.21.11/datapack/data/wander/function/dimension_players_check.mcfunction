execute store result score dimension wander.temp if entity @a[nbt={Dimension:"trader_dimension:pocket"}]
execute store result score overworld wander.temp if entity @a[nbt={Dimension:"minecraft:overworld"},tag=wander.potential_target]
execute if entity @n[tag=wander.ai] run return 0
execute if score overworld wander.temp matches 0 if score dimension wander.temp matches 1.. run function wander:existance/summon_29 with storage wander:temp kidnap_pos