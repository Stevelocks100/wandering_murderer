execute if score daytime wander.data matches -499.. run function wander:trading_stand/leave2_quick
execute unless score daytime wander.data matches -499.. as @n[tag=wander.trading_stand_spawn] at @s rotated as @s run function wander:trading_stand/leave2
execute store result score trading_duration wander.data run random value 100000..120000