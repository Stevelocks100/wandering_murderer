scoreboard players add spawned wander.data 0
scoreboard players add bad_omen wander.data 0


# wander.target stuff.
execute store result score target_count wander.data if entity @a[tag=wander.target]
execute if score target_count wander.data matches 2.. run tag @r[tag=wander.target] remove wander.target
tag @a remove wander.potential_target
tag @a[gamemode=!creative,gamemode=!spectator] add wander.potential_target
tag @a[tag=wander.target,tag=!wander.potential_target] remove wander.target
tag @a[scores={wander.attack_cooldown=1..}] remove wander.target
execute as @a at @s unless dimension minecraft:overworld run tag @s remove wander.potential_target
tag @a[tag=wander.phase3.trapped] remove wander.potential_target


execute if score daytime wander.data matches -500.. run function wander:active_tick
execute unless score bad_omen wander.data matches 1 if score dimension wander.temp matches 1.. if score daytime wander.data matches -501 unless entity abb5e532-ba94-447e-8b50-7b463008a14c run function wander:existence/summon_29 with storage wander:temp kidnap_pos


execute if score daytime wander.data matches -501 if score dragon_egg_timer wander.data matches 1.. run function wander:active_tick
execute if score daytime wander.data matches -501 if score spawned wander.data matches 1 run function wander:active_tick

scoreboard players add @a wander.encounters 0
execute as @a[tag=wander.grow] run function wander:grow_tick

execute as @a[tag=wander.kill_check.regular,tag=!wander.kill_check.internal] at @s rotated as @s run function wander:killed_normal_trader
tag @a remove wander.kill_check.internal
tag @a remove wander.kill_check.regular
advancement revoke @a only wander:killed_internal_trader
advancement revoke @a only wander:killed_trader

# trying to limit @e calls
execute in overworld as @e[type=#wander:ticking_entities,x=0,tag=wander.entity] at @s rotated as @s run function wander:as_every_entity
execute in the_end if score dragon_egg_timer wander.data matches 1.. as @e[type=#wander:ticking_entities,x=0,tag=wander.entity] at @s rotated as @s run function wander:as_every_entity

execute if score gunpowder_count wander.data matches 1.. run function wander:gunpowder/tick

execute if entity @n[tag=wander.ice_spread,x=0,type=marker] run function wander:projectiles/ice/ice_spread

execute unless score spawned wander.data matches 1 unless score daytime wander.data matches -501 run tag @a remove wander.target

execute if score daytime wander.data matches -490..-488 if score health wander.data matches 1.. run scoreboard players set daytime wander.data -501

execute if score daytime wander.data matches -500.. run scoreboard players remove daytime wander.data 1
execute if score daytime wander.data matches -500 run function wander:reward_player


# execute unless entity @n[tag=aj.wander.root,type=item_display] run bossbar set wander:health visible false
execute if score spawned wander.data matches 0 run bossbar set wander:health visible false


# when is this used for players?!
scoreboard players remove @a[scores={wander.attack_cooldown=1..}] wander.attack_cooldown 1






function wander:increase_trader_spawns


# probably keep, it's player only.
execute as @a[tag=wander.sword_jump] at @s run function wander:sword/tick


execute as @e[tag=wander.from_bag] at @s rotated as @s run function wander:bag/as_entity_tick




# maybe do a gunpowder count?
execute if score bad_omen wander.data matches 1 run scoreboard players add @e[tag=wander.bad_omen_fire,type=marker,x=0] wander.gunpowder_timer 1
execute if score bad_omen wander.data matches 1 if predicate {"condition":"minecraft:random_chance","chance":0.25} run scoreboard players add @e[tag=wander.bad_omen_fire,sort=random,limit=5] wander.gunpowder_timer 1

# trading stand stuff. don't move it
execute if entity @p unless score trading_duration wander.data matches ..0 run scoreboard players remove trading_duration wander.data 1
execute if score daytime wander.data matches -499.. store result score trading_duration wander.data run random value 80000..100000
execute if score trading_duration wander.data matches 0 if score defeated wander.data matches 1 if entity @p if entity @n[tag=wander.trading_stand_spawn,x=0,type=item_display,tag=!wander.trading_stand_active] run function wander:trading_stand/arrive
execute as @e[tag=wander.trading_stand_spawn] at @s rotated as @s run function wander:trading_stand/tick


execute if score do_egg_steal milk.settings matches 1 in the_end if entity @p[x=0] run function wander:steal_egg_tick



#phase3 is mcb, and i dont wanna put it in tick tag.
# make some score to determine if this should activate.
function wander:phase3/tick

# fix lag desync infinite launch
scoreboard players remove @a[scores={wander.launch_cd=1..}] wander.launch_cd 1
# must use so enchantment can work
scoreboard players remove @a[scores={wander.amethyst_sword_cd=1..}] wander.amethyst_sword_cd 1

# whey functionality. keep
execute as @a[tag=wander.whey] at @s run function wander:whey/tick

# dimension stuff. goes to lazy tick when nobody is there
execute in wander:pocket if entity @p[x=0] run function wander:trader_dimension/tick

# this would have been cool if i had any ideas.
# function wander:jukebox_animation/tick

# honestly shouldn't be harmful to keep here.
execute as @a[tag=wander.debug] at @s run function wander:ai/debug_text


execute as @a[scores={wander.placed_armor_stand=1..}] at @s run function wander:placed_armor_stand


execute as @a at @s if predicate wander:super_rare_condition_nobody_will_get_unless_they_see_this run function wander:give_joke_discs

execute as @e[tag=wander.spawn_egg,type=armor_stand,x=0] at @s run particle happy_villager ~ ~ ~ 0.2 0.2 0.2 0 3 normal @a