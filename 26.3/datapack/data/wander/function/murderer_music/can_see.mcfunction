# Generated with MC-Build

execute if score ai wander.data matches 27 run return 0
execute if score ai wander.data matches 30 run return 1
execute if score bad_omen wander.data matches 1 run return 1
execute unless dimension overworld run return 0
execute if score spawned wander.data matches 0 run return 0
execute if entity @n[tag=wander.ai,type=wandering_trader,distance=0..5] run return 1
execute unless entity @n[tag=wander.ai,type=wandering_trader,distance=0..100] run return 0
execute summon item_display run function wander:murderer_music/zzz/12
execute store result score current wander.temp run data get entity @s Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:80}
execute if score successful wander.temp matches 0 run return 0
execute anchored eyes facing entity abb5e532-ba94-447e-8b50-7b463008a14c eyes run return run function wander:murderer_music/zzz/13