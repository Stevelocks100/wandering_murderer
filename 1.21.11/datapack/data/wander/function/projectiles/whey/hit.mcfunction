playsound block.decorated_pot.shatter hostile @a[distance=0..32] ~ ~ ~ 1.0 0.7 0.0
playsound block.sand.place hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0
playsound block.sand.place hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0
playsound block.sand.break hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0
playsound block.sand.break hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0
playsound block.sand.break hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0
playsound block.sand.break hostile @a[distance=0..32] ~ ~ ~ 1.5 0.56 0.0

particle dust{color:[0.9,0.9,0.8],scale:1} ~ ~ ~ 0.4 0.4 0.4 0.4 40 normal @a
particle spit ~ ~ ~ 0.4 0.4 0.4 0.2 40 normal @a

kill @s[type=!player]

execute positioned ~-3 ~-3 ~-3 if entity @n[type=happy_ghast,distance=0..20,dx=5,dy=5,dz=5] run function wander:projectiles/whey/happy_ghast
execute as @e[type=#wander:scares_traders,distance=0..10] run function wander:projectiles/whey/scares_trader





