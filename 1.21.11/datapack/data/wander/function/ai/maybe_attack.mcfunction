execute store result score random_attack_chance wander.data run random value -2..20
execute if score random_attack_chance wander.data matches 1..5 run return run scoreboard players set ai wander.data 20

scoreboard players set timer wander.data 6000
playsound minecraft:entity.wandering_trader.no hostile @a[distance=0..16] ~ ~ ~ 1.0 0.6 0.0
function wander:ai/stalk/drink_potion
