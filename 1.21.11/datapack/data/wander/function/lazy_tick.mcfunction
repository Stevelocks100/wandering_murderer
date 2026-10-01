schedule function wander:lazy_tick 1s

execute as @a at @s run function wander:murderer_music/preload

execute if score ai wander.data matches 20..30 as 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f if entity @s[tag=wander.despawning] run data modify entity @s Invulnerable set value 0b
execute if score ai wander.data matches 20..30 as 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f if entity @s[tag=wander.despawning] run tag @s add wander.hitbox
execute if score ai wander.data matches 20..30 as 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f if entity @s[tag=wander.despawning] run tag @s add wander.despawning

clear @a painting[painting/variant="wander:obtain"]

execute unless score daytime wander.data matches 1.. run scoreboard players set timer wander.data 0
execute if score spawned wander.data matches 1 unless entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f at abb5e532-ba94-447e-8b50-7b463008a14c unless dimension the_end run summon wandering_trader ~ ~ ~ {Tags:["wander.hitbox","wander"],attributes:[{id:"scale",base:2},{id:"max_health",base:1024}],NoGravity:1b,Health:1017,NoAI:1b,Silent:1b,Team:"wander.nocol",UUID:[I;657428086,-151106681,-1509322801,1420348191]}

execute if score timer1 wander.music.tps = timer2 wander.music.tps run function wander:murderer_music/tps_counter/init
execute if score tps wander.music.tps matches 0 run function wander:murderer_music/tps_counter/init

kill @e[tag=wander.temp]
kill @e[x=0,type=item_display,tag=wander.spawn.spawn_center]
execute if score spawned wander.data matches 1 run kill @e[tag=wander.spawn_pos,x=0,type=item_display]
# removes the target of a jump if no trader.
execute unless score spawned wander.data matches 1 run kill @n[tag=wander.jump_target,x=0,type=marker]

execute store result score ice_projectile_count wander.data if entity @e[tag=wander.ice_proj,x=0]
execute store result score sword_projectile_count wander.data if entity @e[tag=wander.sword_proj,x=0]

# reset data of players when not active (more or less)
execute if score daytime wander.data matches -501 run scoreboard players set @a wander.trader_damage_dealt 0
execute as @a[tag=wander.keep_damage_dealt] run scoreboard players operation @s wander.trader_damage_dealt += @s wander.damage_dealt
scoreboard players set @a wander.damage_dealt 0
tag @a remove wander.keep_damage_dealt

# add trades to wandering traders
execute as @e[type=wandering_trader,tag=!wander,tag=!wander.trade_checked,x=0] if data entity @s Offers.Recipes[0] run function wander:add_wandering_trader_trades

# spawns in other dimension. tbh shouldn't be much of an issue no matter how ya slice it
execute in wander:pocket unless block -80 -64 -80 spruce_planks run scoreboard players set placed_pocket wander.data 0
execute in wander:pocket if block -80 -64 -80 spruce_planks run scoreboard players set placed_pocket wander.data 1
execute if score placed_pocket wander.data matches 0 in wander:pocket if loaded -80 -64 -80 run place template wander:trader_pocket_dimension -80 -64 -80 none

execute in wander:pocket unless entity @p[x=0] run function wander:trader_dimension/tick

execute as @e[tag=wander.sandbag_display,x=0] unless predicate wander:is_mounted run kill

execute if score spawned wander.data matches 1 unless entity @n[tag=wander.threw_sword,x=0,type=wandering_trader] run kill @n[tag=wander.sword_proj_display,tag=wander.sword_proj_display_landed,type=item_display,x=0]
execute unless score spawned wander.data matches 1 at @n[tag=wander.sword_proj_display_landed,x=0,type=item_display] unless entity @n[tag=wander.gunpowder,distance=0..4] run kill @n[tag=wander.sword_proj_display_landed]
