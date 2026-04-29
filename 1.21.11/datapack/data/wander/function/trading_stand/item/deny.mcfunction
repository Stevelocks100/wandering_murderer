execute at @n[tag=aj.wander.root] positioned ~ ~2 ~ run playsound entity.wandering_trader.no hostile @a[distance=0..70] ~ ~ ~ 1.0 0.6 0.0
execute as @n[tag=aj.wander.root] run function animated_java:wander/animations/sit_no/play
