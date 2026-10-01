execute positioned 8.5 62.0 6.5 positioned over motion_blocking positioned ~ ~10 ~ run function wander:existence/summon_revenge
scoreboard players set ai wander.data 40
scoreboard players set daytime wander.data 99999
scoreboard players set timer wander.data 999999
data modify entity 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f Invulnerable set value 1b
execute positioned 0 62 0 run playsound wander:wandering_murderer.phase1 hostile @a[distance=0..200] ~ ~ ~ 1.0 1.0 1.0
scoreboard players set dragon_egg_timer wander.data 2

function wander:steal_dragon_egg/set_sword_destination

# execute in the_end positioned 0.0 0 0.0 positioned over motion_blocking unless block ~ ~-1 ~ dragon_egg align xyz positioned ~0.5 ~0.5 ~0.5 run summon item_display ~ ~ ~ {Tags:["wander.dragon_egg","wander.entity"],item:{id:"dragon_egg",count:1}}
# execute in the_end positioned 0.0 0 0.0 positioned over motion_blocking positioned ~ ~-1 ~ if block ~ ~ ~ dragon_egg 

# execute positioned 0.0 0 0.0 positioned over motion_blocking positioned ~ ~-1 ~ if block ~ ~ ~ dragon_egg run setblock ~ ~ ~ air strict
# if some chud blocks the dragon egg we do this
fill 0 0 0 0 255 0 command_block{auto:1b,Command:'function wander:steal_dragon_egg/replace_dragon_egg'} replace dragon_egg strict