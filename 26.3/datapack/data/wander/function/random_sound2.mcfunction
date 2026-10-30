execute if score random_sound wander.data matches 1 run playsound entity.wandering_trader.ambient hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
execute if score random_sound wander.data matches 2 run playsound entity.wandering_trader.disappeared hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
execute if score random_sound wander.data matches 3 run playsound entity.wandering_trader.hurt hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
execute if score random_sound wander.data matches 4 run playsound entity.wandering_trader.no hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
#execute if score random_sound wander.data matches 5 run playsound entity.wandering_trader.reappeared hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
execute if score random_sound wander.data matches 6 run playsound entity.wandering_trader.trade hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3
execute if score random_sound wander.data matches 7 run playsound entity.wandering_trader.yes hostile @a[distance=0..70] ~ ~50 ~ 0.3 0.6 0.3

kill @s