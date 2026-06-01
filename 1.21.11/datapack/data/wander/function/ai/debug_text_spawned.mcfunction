
data modify storage wander:temp debug set value ["Timer: ",{underlined:true,score:{name:"timer",objective:"wander.data"}},", Target: ",{selector:"@p[tag=wander.target]"}]

execute if score bad_omen wander.data matches 1 run data modify storage wander:temp debug set value ["Target: ",{selector:"@p[tag=wander.target]"}]

#execute if score ai wander.data matches -2..5 run data modify storage wander:temp debug append value ", AI: "
#execute if score ai wander.data matches -2..5 run data modify storage wander:temp debug append value {score:{name:"ai",objective:"wander.data"}}
#
#execute if score ai wander.data matches 22.. run data modify storage wander:temp debug append value ", AI: "
#execute if score ai wander.data matches 22.. run data modify storage wander:temp debug append value {score:{name:"ai",objective:"wander.data"}}

data modify storage wander:temp debug append value ", AI: "
data modify storage wander:temp debug append value {score:{name:"ai",objective:"wander.data"}}

execute if score ai wander.data matches 29 run return run data modify storage wander:temp debug set value ["Anti-softlock"]

execute unless dimension overworld run return 0

execute if score ai wander.data matches 20..26 run data modify storage wander:temp debug append value ", Health: "
execute if score ai wander.data matches 20..26 run data modify storage wander:temp debug append value {score:{name:"health",objective:"wander.data"}}




execute if score ai wander.data matches 0 run data modify storage wander:temp debug append value ", Impatience: "
execute if score ai wander.data matches 0 run data modify storage wander:temp debug append value {underlined:true,score:{name:"0.impatient",objective:"wander.data"}}
execute if score ai wander.data matches 0 run data modify storage wander:temp debug append value " < 300"

execute if score ai wander.data matches 0 if data entity @n[tag=wander.ai,type=wandering_trader,distance=0..] wander_target run data modify storage wander:temp debug append value ", Moving"


scoreboard players set looked_at wander.data 0
execute at @n[tag=wander.ai] if function wander:ai/stalk/is_target_looking run scoreboard players set looked_at wander.data 1

execute if score ai wander.data matches 0 run data modify storage wander:temp debug append value ", Facing: "
execute if score ai wander.data matches 0 run data modify storage wander:temp debug append value {underlined:true,score:{name:"looked_at",objective:"wander.data"}}


execute if score ai wander.data matches 1 run data modify storage wander:temp debug append value ", Standoff: "
execute if score ai wander.data matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"standoff",objective:"wander.data"}}

execute if score ai wander.data matches 20..26 if entity @n[tag=wander.ai,type=wandering_trader,distance=0..,tag=wander.force_kidnap] run data modify storage wander:temp debug append value ", Kidnap"

execute if score @s wander.song matches 0.. run data modify storage wander:temp debug append value ", Phase: "
execute if score @s wander.song matches 0.. run data modify storage wander:temp debug append value {underlined:true,score:{name:"current_phase",objective:"wander.song"}}


execute if entity @n[tag=wander.gunpowder,type=armor_stand,distance=0..] if score ai wander.data matches 20..21 run data modify storage wander:temp debug append value ", Gunpowder: "
execute if entity @n[tag=wander.gunpowder,type=armor_stand,distance=0..] if score ai wander.data matches 20..21 run data modify storage wander:temp debug append value {underlined:true,score:{name:"gunpowder_count",objective:"wander.data"}}


execute if score ai wander.data matches 21 unless score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value ", Swipes: "
execute if score ai wander.data matches 21 unless score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"failed_sword_swipes",objective:"wander.data"}}


execute if score ai wander.data matches 24 run data modify storage wander:temp debug append value ", Distance: "
execute if score ai wander.data matches 24 run data modify storage wander:temp debug append value {underlined:true,score:{name:"sword_distance",objective:"wander.data"}}

execute if score ai wander.data matches 24 run data modify storage wander:temp debug append value ", Sword Jump: "
execute if score ai wander.data matches 24 run data modify storage wander:temp debug append value {underlined:true,score:{name:"jump_for_sword",objective:"wander.data"}}


execute if score ai wander.data matches 25 run data modify storage wander:temp debug append value ", Distance: "
execute if score ai wander.data matches 25 run data modify storage wander:temp debug append value {underlined:true,score:{name:"player_distance",objective:"wander.data"}}


execute if score ai wander.data matches 20..21 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {text:", Player Height: ",color:"red"}
execute if score ai wander.data matches 20..21 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"player_height",objective:"wander.temp"},color:"red"}


execute if score ai wander.data matches 20..21 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {text:", Distance: ",color:"red"}
execute if score ai wander.data matches 20..21 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"horizontal_dist",objective:"wander.data"},color:"red"}

execute if score not_moving wander.data matches 1.. if score ai wander.data matches 20 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {text:", Moving: ",color:"red"}
execute if score not_moving wander.data matches 1.. if score ai wander.data matches 20 if score bad_omen wander.data matches 1 run data modify storage wander:temp debug append value {underlined:true,score:{name:"not_moving",objective:"wander.data"},color:"red"}


execute if score ai wander.data matches 22 run data modify storage wander:temp debug append value {text:", Jump: ",color:"red"}
execute if score ai wander.data matches 22 run data modify storage wander:temp debug append value {underlined:true,score:{name:"22_jump",objective:"wander.data"},color:"red"}



execute at @n[tag=wander.ai] run particle minecraft:witch ~ ~10 ~ 0.5 2 0.5 0 10 force @s[distance=0..100]
data modify storage wander:temp destination.x set from entity @n[tag=wander.ai,type=wandering_trader,distance=0..] wander_target[0]
data modify storage wander:temp destination.y set from entity @n[tag=wander.ai,type=wandering_trader,distance=0..] wander_target[1]
data modify storage wander:temp destination.z set from entity @n[tag=wander.ai,type=wandering_trader,distance=0..] wander_target[2]

execute if data entity @n[tag=wander.ai,type=wandering_trader,distance=0..] wander_target run function wander:ai/debug_text_spawned_target with storage wander:temp destination