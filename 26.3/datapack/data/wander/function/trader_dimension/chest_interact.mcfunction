# Generated with MC-Build

advancement revoke @s only wander:trader_dimension/chest_interact
scoreboard players add @s wander.trader_dimension.chests_opened 1
schedule function wander:trader_dimension/zzz/10 5s replace
execute as @e[tag=aj.wander_chest.node.hitbox,distance=0..5] if data entity @s interaction run function wander:trader_dimension/zzz/11