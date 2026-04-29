execute if score health wander.data > 66%health wander.data run scoreboard players set current_phase wander.song 1
execute if score health wander.data <= 66%health wander.data if score health wander.data > 33%health wander.data run scoreboard players set current_phase wander.song 2
execute if score health wander.data <= 33%health wander.data run scoreboard players set current_phase wander.song 3
execute if score 33%health wander.data matches -1 run scoreboard players set current_phase wander.song 3
execute if score ai wander.data matches 30..32 run scoreboard players set current_phase wander.song 1

execute if score ai wander.data matches -2 run scoreboard players set current_phase wander.song 4


execute if score do_music milk.settings matches -1 run return 0
execute if entity @n[tag=aj.wander.root] if score ai wander.data matches 20..30 unless score ai wander.data matches 29 as @a at @s if entity @n[tag=aj.wander.root,distance=0..150] run function wander:murderer_music/play_song
execute if score ai wander.data matches -2 as @a at @s if entity @n[tag=aj.wander.root,distance=0..150] if score @s wander.song matches 1.. run function wander:murderer_music/ending
execute if score ai wander.data matches 31 as @a at @s if entity @n[tag=aj.wander.root,distance=0..150] if score @s wander.song matches 1.. run function wander:murderer_music/ending
execute if score ai wander.data matches 33 as @a at @s if entity @n[tag=aj.wander.root,distance=0..150] if score @s wander.song matches 1.. run function wander:murderer_music/ending

execute as @a at @s unless entity @n[tag=aj.wander.root,distance=0..200] run scoreboard players set @s wander.song -1

stopsound @a ambient wander:wandering_murderer.slaughterer_intro
stopsound @a ambient wander:wandering_murderer.phase1
stopsound @a ambient wander:wandering_murderer.phase2
stopsound @a ambient wander:wandering_murderer.phase3
stopsound @a ambient wander:wandering_murderer.phase1_slaughterer
stopsound @a ambient wander:wandering_murderer.phase2_slaughterer
stopsound @a ambient wander:wandering_murderer.phase3_slaughterer
stopsound @a ambient wander:wandering_murderer.ending
stopsound @a ambient wander:wandering_murderer.slaughterer_ending
stopsound @a ambient wander:wandering_murderer.phase3_slaughterer_bridge
