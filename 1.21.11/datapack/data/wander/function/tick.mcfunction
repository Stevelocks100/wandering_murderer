execute unless entity @n[tag=aj.wander.root] if entity @n[tag=wander.spawn_pos] run scoreboard players set spawn_check wander.temp 0
execute unless entity @n[tag=aj.wander.root] if entity @n[tag=wander.spawn_pos] as @n[tag=wander.spawn_pos] at @s if entity @p[tag=wander.potential_target,distance=0..10] run scoreboard players set spawn_check wander.temp 1

execute unless entity @n[tag=aj.wander.root] if entity @n[tag=wander.spawn_pos] as @a[distance=0..40,tag=!wander.target] at @s facing entity @n[tag=wander.spawn_pos] feet run function wander:spawn_search/facing_check
execute unless entity @n[tag=aj.wander.root] if entity @n[tag=wander.spawn_pos] as @p[tag=wander.target] at @s facing entity @n[tag=wander.spawn_pos] feet run function wander:spawn_search/facing_check_target
execute unless entity @n[tag=aj.wander.root] if score spawn_check wander.temp matches 0 as @n[tag=wander.spawn_pos] at @s rotated as @s rotated ~180 0 run function wander:existance/summon

execute if entity @n[tag=wander.ai] at @n[tag=wander.ai] run particle happy_villager ~ ~10 ~ 0.5 2 0.5 0 10 normal @a[tag=wander.debug]
execute as @n[tag=wander.ai] at @s rotated as @s run function wander:ai/as_root

execute store result score target_count wander.data if entity @a[tag=wander.target]
execute if score target_count wander.data matches 2.. run tag @r[tag=wander.target] remove wander.target
tag @a remove wander.potential_target
execute unless score hard_mode wander.data matches 1 run tag @a[gamemode=!creative,gamemode=!spectator] add wander.potential_target
execute if score hard_mode wander.data matches 1 run tag @a[gamemode=!creative,gamemode=!spectator,tag=wander.whey_target] add wander.potential_target
execute as @a at @s if dimension trader_dimension:pocket run tag @s remove wander.potential_target
tag @a[tag=wander.target,tag=!wander.potential_target] remove wander.target
tag @a[scores={wander.attack_cooldown=1..}] remove wander.target
execute as @a at @s unless dimension minecraft:overworld run tag @s remove wander.potential_target
scoreboard players add @a wander.encounters 0
execute as @a[tag=wander.grow] run function wander:grow_tick

execute if score daytime wander.data matches -501 run tag @a remove wander.whey_target

execute as @a[tag=wander.kill_check.regular,tag=!wander.kill_check.internal] at @s run function wander:killed_normal_trader
tag @a remove wander.kill_check.internal
tag @a remove wander.kill_check.regular
advancement revoke @a only wander:killed_internal_trader
advancement revoke @a only wander:killed_trader

function wander:projectiles/tick

tag @e[tag=wander.ice_spread,tag=new] remove new
execute as @e[tag=wander.ice_spread,tag=!new,limit=15,sort=random] at @s run function wander:ice_spread
execute as @n[tag=wander.sword_proj_display,tag=!wander.sword_proj_display_landed] unless predicate wander:riding_arrow run tag @s add wander.sword_proj_display_landed
execute unless entity @n[tag=wander.ai] run kill @n[tag=wander.sword_proj_display_landed]
execute as @e[tag=wander.ice_proj_display] at @s unless entity @n[tag=wander.ice_proj,distance=0..1] run function wander:projectiles/ice/convert_nearby_water
execute as @e[tag=wander.ice_proj_display] at @s unless entity @n[tag=wander.ice_proj,distance=0..1] run kill @s

execute as @n[tag=aj.wander.bone,tag=!aj.wander.root] unless predicate wander:is_mounted run kill @e[tag=aj.wander.entity]
execute as @n[tag=aj.wander.bone,tag=!aj.wander.root] unless predicate wander:is_mounted run function wander:existance/remove

execute as @n[tag=wander.jump_target] at @s unless entity @n[tag=wander.ai] run kill


execute unless entity @n[tag=wander.tower_detection] unless entity @n[tag=wander.tower_checked] run scoreboard players set active_downwards_check wander.data 0

execute unless entity @n[tag=wander.ai] run tag @a remove tower.player
execute unless entity @n[tag=wander.ai] unless score ai wander.data matches -501 run tag @a remove wander.target

execute as @n[tag=wander.tower_bottom] at @s run function wander:tower_player_distance

execute if score daytime wander.data matches -490..-488 if score health wander.data matches 1.. run scoreboard players set daytime wander.data -501

execute if score daytime wander.data matches -500.. run scoreboard players remove daytime wander.data 1
execute if score daytime wander.data matches -500 as @p[tag=wander.kill_credit] run tag @s add wander.target
execute if score daytime wander.data matches -500 unless entity @p[tag=wander.kill_credit] run tag @r[tag=wander.potential_target] add wander.target
execute if score daytime wander.data matches -500 as @p[tag=wander.kill_credit] run tag @s remove wander.kill_credit
execute if score daytime wander.data matches -500 as @p[tag=wander.target] at @s rotated as @s rotated ~ 0 positioned ^ ^ ^-20 positioned over motion_blocking_no_leaves run function wander:existance/summon_30
tag @a remove wander.survived

execute unless entity @n[tag=aj.wander.root] run bossbar set wander:health visible false

#wander timer

execute unless entity @n[tag=wander.ai] run scoreboard players add timer wander.data 5
execute if entity @n[tag=wander.ai] if score ai wander.data matches 4.. run scoreboard players remove timer wander.data 1

execute unless score daytime wander.data matches 1.. run scoreboard players set timer wander.data 0


execute if score timer wander.data > new_spawn_time wander.data unless entity @n[tag=wander.ai] if score daytime wander.data matches 1.. if score timer wander.data matches 2000.. run function wander:select_spawn
execute if score new_spawn_time wander.data matches 10000.. unless entity @n[tag=wander.ai] if score daytime wander.data matches 1.. if score timer wander.data matches 2000.. run function wander:select_spawn
execute if score new_spawn_time wander.data matches 10000.. unless entity @n[tag=wander.ai] if score daytime wander.data matches 1.. run tag @a remove wander.new_target
execute if score timer wander.data > new_spawn_time wander.data unless entity @n[tag=wander.ai] if score daytime wander.data matches 1.. run tag @a remove wander.new_target
execute store result score tower_players wander.temp if entity @a[tag=tower.player]
execute if score tower_players wander.temp matches 2.. run tag @a remove tower.player


execute as @a if score @s wander.actual_deaths matches 1.. run scoreboard players set @s wander.attack_cooldown 100
execute as @a if score @s wander.actual_deaths matches 1.. run scoreboard players set @s wander.actual_deaths 0

scoreboard players remove @a[scores={wander.attack_cooldown=1..}] wander.attack_cooldown 1

function wander:dimension_players_check
execute if score daytime wander.data matches 0 run title @a times 0 40 20
execute if score daytime wander.data matches 0 run title @a actionbar "You feel the threatening presense vanish..."

execute if score dimension wander.temp matches 1.. if score daytime wander.data matches -501 run function wander:existance/summon_29 with storage wander:temp kidnap_pos


scoreboard players add @e[tag=wander.jenga_checked] wander.temp 1
kill @e[tag=wander.jenga_checked,scores={wander.temp=3..}]
scoreboard players add @e[tag=wander.tower_collapse] wander.temp 1
kill @e[tag=wander.tower_collapse,scores={wander.temp=3..}]


execute if score active_upwards_check wander.data matches 1 run function wander:tower_collapse/tree/upwards/recursive
execute if score active_upwards_check wander.data matches 1 run function wander:tower_collapse/tree/upwards/recursive

#execute if score daytime wander.data matches 4.. run function wander:daylight_cycle

execute as @e[type=area_effect_cloud,tag=,nbt={Duration:-1}] run kill @s


execute if predicate {"condition":"minecraft:time_check","value":{"min":1000,"max":12000},"period":24000} run scoreboard players add random_trader wander.data 1
execute if score random_trader wander.data matches 20000.. run scoreboard players set random_trader wander.data 0
execute if score random_trader wander.data matches 3 if predicate [{"condition":"minecraft:random_chance","chance":0.15},{"condition":"minecraft:time_check","value":{"min":1000,"max":12000},"period":24000}] as @r[gamemode=!spectator] at @s run function wander:summon_regular_trader_random