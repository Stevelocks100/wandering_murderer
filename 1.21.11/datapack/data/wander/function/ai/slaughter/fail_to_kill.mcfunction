function wander:ai/despawn
scoreboard players set daytime wander.data -2
scoreboard players set timer wander.data -100
advancement grant @a[distance=0..90] only wander:story/fail_slaughterer
scoreboard players set health wander.data 999