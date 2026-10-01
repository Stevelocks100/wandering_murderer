# Generated with MC-Build

scoreboard players set @s wander.spawn.spawn_score 0
scoreboard players set #encounter_count wander.spawn 10
scoreboard players operation #encounter_count wander.spawn -= @s wander.encounters
execute if score #encounter_count wander.spawn matches ..-1 run scoreboard players set #encounter_count wander.spawn 0
execute if score #encounter_count wander.spawn matches 11.. run scoreboard players set #encounter_count wander.spawn 10
# depending on encounters, ranging from 0 to 10. 10 points for 0 encounters, 0 points for 10+ encounters
# wander.player_not_moving=300..
# score 500 = 10 (aka divide by 50), and lower will just be closer to 0
scoreboard players operation #afk_timer wander.spawn = @s wander.player_not_moving
scoreboard players set 50 wander.spawn 50
scoreboard players operation #afk_timer wander.spawn /= 50 wander.spawn
execute if score #afk_timer wander.spawn matches ..-1 run scoreboard players set #afk_timer wander.spawn 0
execute if score #afk_timer wander.spawn matches 11.. run scoreboard players set #afk_timer wander.spawn 10
# and now for the loneliest player. it's probably good to first check if they are above ground/near ground (which could mean in a house)
scoreboard players set #lonely wander.spawn 0
execute unless entity @p[tag=wander.potential_target,distance=0.1..10] run scoreboard players add #lonely wander.spawn 2
execute unless entity @p[tag=wander.potential_target,distance=0.1..20] run scoreboard players add #lonely wander.spawn 2
execute unless entity @p[tag=wander.potential_target,distance=0.1..30] run scoreboard players add #lonely wander.spawn 2
execute unless entity @p[tag=wander.potential_target,distance=0.1..40] run scoreboard players add #lonely wander.spawn 2
execute unless entity @p[tag=wander.potential_target,distance=0.1..50] run scoreboard players add #lonely wander.spawn 2
# so max here is 10 currently. I feel like this should have a bit of priority so let's go to 20.
execute if function wander:spawning/is_near_surface run scoreboard players add #lonely wander.spawn 3
execute if function wander:spawning/is_on_surface run scoreboard players add #lonely wander.spawn 7
# is player is in a cave, it's a lower value. especially low when with other people.
scoreboard players operation @s wander.spawn.spawn_score += #encounter_count wander.spawn
scoreboard players operation @s wander.spawn.spawn_score += #afk_timer wander.spawn
scoreboard players operation @s wander.spawn.spawn_score += #lonely wander.spawn