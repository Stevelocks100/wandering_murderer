execute if entity @s[nbt={OnGround:1b}] run tag @s remove wander.jump_for_sword
execute if block ~ ~ ~ #wander:water_ish run tag @s remove wander.jump_for_sword
execute if block ~ ~-1 ~ #wander:water_ish run tag @s remove wander.jump_for_sword

execute if entity @s[tag=wander.jump_for_sword] run return 0
execute if entity @s[tag=wander.jump_landing] run function wander:ai/land
tag @s remove wander.jump_for_target

execute if score dragon_egg_timer wander.data matches 1..28 run attribute @s movement_speed base set 0
execute if score dragon_egg_timer wander.data matches 1.. facing -33.5 62 -24.5 run rotate @s ~ 0

execute if score dragon_egg_timer wander.data matches 3 as @n[tag=aj.wander.root] run function animated_java:wander/animations/sword_throw/play
execute if score dragon_egg_timer wander.data matches 3..23 run scoreboard players add dragon_egg_timer wander.data 1

execute if score dragon_egg_timer wander.data matches 24 as @n[tag=aj.wander.root] run function animated_java:wander/at_locator {name:"righthand",command:"function wander:steal_dragon_egg/sword_trajectory"}
execute if score dragon_egg_timer wander.data matches 24 run scoreboard players set dragon_egg_timer wander.data 25
execute if score dragon_egg_timer wander.data matches 2 as @n[tag=aj.wander.root] run function animated_java:wander/animations/angry_idle/play
execute if score dragon_egg_timer wander.data matches 2 run scoreboard players set dragon_egg_timer wander.data 3


execute if score dragon_egg_sword wander.data matches 45 run function wander:steal_dragon_egg/jump_to_sword

execute if score dragon_egg_timer wander.data matches 26 unless data entity @s {OnGround:1b} run scoreboard players set dragon_egg_timer wander.data 27
execute if score dragon_egg_timer wander.data matches 27 if data entity @s {OnGround:1b} as @n[tag=aj.wander.root] run function animated_java:wander/animations/angry_idle/play
execute if score dragon_egg_timer wander.data matches 27 if data entity @s {OnGround:1b} run kill @n[tag=wander.dragon_egg]
execute if score dragon_egg_timer wander.data matches 27 if data entity @s {OnGround:1b} run kill @n[tag=wander.dragon_egg_sword]
execute if score dragon_egg_timer wander.data matches 27 if data entity @s {OnGround:1b} run scoreboard players set dragon_egg_timer wander.data 28

execute if score dragon_egg_timer wander.data matches 28..37 run scoreboard players add dragon_egg_timer wander.data 1
execute if score dragon_egg_timer wander.data matches 31 run attribute @s movement_speed base set 1.1
execute if score dragon_egg_timer wander.data matches 31 run data modify entity @s wander_target set value [I;-13, 200, -10]

execute if score dragon_egg_timer wander.data matches 38 run stopsound @a * wander:wandering_murderer.phase1
execute if score dragon_egg_timer wander.data matches 38 run playsound wander:wandering_murderer.ending hostile @a[distance=0..] ~ ~ ~ 1.0 1.0 1.0
execute if score dragon_egg_timer wander.data matches 38 run function wander:steal_dragon_egg/add_trade
execute if score dragon_egg_timer wander.data matches 38 run rotate @s facing 0.0 ~ 0.0
execute if score dragon_egg_timer wander.data matches 38 rotated as @s run function wander:ai/despawn
execute if score dragon_egg_timer wander.data matches 38 run scoreboard players set dragon_egg_timer wander.data 39