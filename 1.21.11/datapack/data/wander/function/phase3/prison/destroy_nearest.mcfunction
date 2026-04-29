# Generated with MC-Build

tag @s remove wander.phase3.trapped
playsound minecraft:block.glass.break hostile @a[distance=0..32] ~ ~ ~ 2.0 0.5 0.0
playsound minecraft:block.beacon.deactivate hostile @a[distance=0..32] ~ ~ ~ 2.0 0.7 0.0
particle minecraft:item{item:{id:"emerald",count:1}} ~ ~ ~ 0.3 0.6 0.3 0.1 200 normal @a
kill @n[tag=wander.phase3.prison,distance=0..2,type=item_display]
tp @e[tag=wander.phase3.prison_hitbox] ~ ~-1000 ~
kill @e[tag=wander.phase3.prison_hitbox]