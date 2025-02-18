execute unless entity @n[tag=wander.sword_proj_direction,distance=0..0.1] on passengers facing entity @n[tag=wander.sword_proj_direction] feet facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~






kill @n[tag=wander.sword_proj_direction]
summon marker ~ ~ ~ {Tags:["wander.sword_proj_direction"]}

#execute if entity @s[nbt={inGround:1b}] on passengers run kill @s
execute if entity @s[nbt={inGround:1b}] run playsound minecraft:item.trident.return hostile @a[distance=0..32] ~ ~ ~ 2.0 0.7 0.0
execute if entity @s[nbt={inGround:1b}] on passengers run tag @s add wander.sword_proj_display_landed
execute if entity @s[nbt={inGround:1b}] on passengers rotated as @s positioned ^ ^ ^0.5 run function wander:projectiles/sword/recursive_player_check

#execute if entity @s[nbt={inGround:1b}] on passengers run data modify entity @s transformation.translation set value [0.0d,0.0d,0.0d]
execute if entity @s[nbt={inGround:1b}] run stopsound @a[distance=0..32] * entity.arrow.hit
execute if entity @s[nbt={inGround:1b}] run kill @n[tag=wander.sword_proj_direction]
execute if entity @s[nbt={inGround:1b}] run kill @s

#execute on passengers rotated as @s positioned ^ ^ ^1 unless block ~ ~ ~ #wander:air_ish align xyz positioned ~0.5 ~ ~0.5 run function wander:projectiles/sword/recursive_player_check
#execute on passengers rotated as @s positioned ^ ^ ^2 unless block ~ ~ ~ #wander:air_ish align xyz positioned ~0.5 ~ ~0.5 run function wander:projectiles/sword/recursive_player_check