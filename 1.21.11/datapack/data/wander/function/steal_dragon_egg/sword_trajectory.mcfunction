# start is around 8.5 62.0 6.5
# end is -31.5 ground+7 -22.5
# -40 -29
# half xz dist = -20 -14.5

scoreboard players add dragon_egg_sword wander.data 1

execute if score dragon_egg_sword wander.data matches 1 run kill @n[tag=wander.dragon_egg_sword]
execute if score dragon_egg_sword wander.data matches 1 run summon item_display ~ ~ ~ {Tags:["wander.dragon_egg_sword"],item:{id:"iron_ingot",count:1,components:{"minecraft:item_model":"wander:hugeasssword"}},transformation:{left_rotation:[0.0d,0.0d,0.0d,1.0d],right_rotation:[0.0d,0.0d,0.0d,1.0d],scale:[2.0d,2.0d,2.0d],translation:[0.0d,-0.8d,0.0d]},Rotation:[124.4,-20],teleport_duration:4}
execute if score dragon_egg_sword wander.data matches 1 in the_end positioned 0 62 0 positioned over motion_blocking as @n[tag=wander.dragon_egg_sword] rotated as @s run tp @s ~ ~1 ~ ~ -5
execute if score dragon_egg_sword wander.data matches 5 run data modify entity @n[tag=wander.dragon_egg_sword] teleport_duration set value 10
execute if score dragon_egg_sword wander.data matches 5 in the_end run ride @n[tag=wander.dragon_egg] mount @n[tag=wander.dragon_egg_sword]

execute if score dragon_egg_sword wander.data matches 6 in the_end positioned -10 62 -7.5 positioned over motion_blocking as @n[tag=wander.dragon_egg_sword] rotated as @s run tp @s ~ ~10 ~ ~ 0
execute if score dragon_egg_sword wander.data matches 15 run data modify entity @n[tag=wander.dragon_egg_sword] teleport_duration set value 8
execute if score dragon_egg_sword wander.data matches 16 in the_end as @n[tag=wander.dragon_egg_sword] at @s facing entity @n[tag=wander.sword_destination,distance=0..] feet run tp @s ^ ^ ^10 ~ 0
execute if score dragon_egg_sword wander.data matches 21 in the_end at @n[tag=wander.sword_destination,distance=0..] as @n[tag=wander.dragon_egg_sword] rotated as @s run tp @s ~ ~ ~ ~ 15

execute if score dragon_egg_sword wander.data matches 50.. run return run scoreboard players set dragon_egg_sword wander.data 0
schedule function wander:steal_dragon_egg/sword_trajectory 1t