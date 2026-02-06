data modify entity @s NoAI set value 1b
execute unless entity @s[tag=wander.giving_sword] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword1.playing] run playsound minecraft:entity.wandering_trader.reappeared hostile @a[distance=0..32] ~ ~ ~ 2.0 0.5 0.0
execute unless entity @s[tag=wander.giving_sword] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword1.playing] run particle happy_villager ~ ~2 ~ 2 2 2 0 30 normal @a
execute unless entity @s[tag=wander.giving_sword] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword1.playing] run function animated_java:wander/animations/pause_all
execute unless entity @s[tag=wander.giving_sword] as @n[tag=aj.wander.root] unless entity @s[tag=aj.wander.animation.give_sword1.playing] run function animated_java:wander/animations/give_sword1/tween {to_frame:0,duration:4}
execute if entity @s[tag=wander.giving_sword] unless entity @n[tag=wander.sword_int] run function wander:ai/give_sword/summon_interaction
execute as @n[tag=wander.sword_int] if data entity @s interaction on target if entity @s[tag=wander.target] run function wander:ai/give_sword/32
execute as @n[tag=wander.sword_int] if data entity @s interaction on target if entity @s[tag=!wander.target] unless entity @p[tag=wander.target,distance=0..3] run function wander:ai/give_sword/32

execute as @n[tag=wander.sword_int] if data entity @s interaction run data remove entity @s interaction

execute unless entity @p[tag=wander.potential_target,distance=0..30] run function wander:ai/stalk/drink_potion
execute unless entity @p[tag=wander.potential_target,distance=0..30] run scoreboard players set ai wander.data 33


execute unless entity @p[tag=wander.target] run tag @p[tag=wander.potential_target] add wander.target

execute as @a at @s if dimension trader_dimension:pocket run function trader_dimension:leave