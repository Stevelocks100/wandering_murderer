# Generated with MC-Build

# if not spawned, go do spawning related stuff.
# spawn_check: 1 = shouldn't spawn. 0 = can spawn.
scoreboard players set spawn_check wander.temp 0
execute as @n[tag=wander.spawn_pos,type=item_display,x=0] at @s if entity @p[tag=wander.potential_target,distance=0..10] run return run scoreboard players set spawn_check wander.temp 1
# facing check sets "spawn_check wander.temp" to 1 if the player is looking at the spawn point.
# for the facing check, it checks all players, and sets to 1 if ANY player is looking.
# target facing check does the same, but only for the target.
execute as @a[tag=wander.potential_target,distance=0..40] at @s facing entity @n[tag=wander.spawn_pos,x=0,type=item_display] feet run function wander:spawning/facing_check
# if not spawned, if nobody looking, at spawn point, spawn it in.
# apparently rotation here doesn't do crap so i removed it.
execute if score spawn_check wander.temp matches 0 as @n[tag=wander.spawn_pos,x=0,type=item_display] at @s run function wander:existence/summon