execute if score do_music milk.settings matches -1 run return 0
execute if entity @n[tag=aj.wander.root] if score ai wander.data matches 20..28 as @a at @s if entity @n[tag=aj.wander.root,distance=0..48] run function murderer_music:play_song
execute if score ai wander.data matches -2 as @a at @s if entity @n[tag=aj.wander.root,distance=0..48] if score @s wander.song matches 3.. run function murderer_music:ending
execute as @a at @s unless entity @n[tag=aj.wander.root,distance=0..48] run scoreboard players set @s wander.song 0
execute if score health wander.data matches 400..700 run scoreboard players set current_phase wander.song 1
execute if score health wander.data matches 200..399 run scoreboard players set current_phase wander.song 2
execute if score health wander.data matches ..199 run scoreboard players set current_phase wander.song 3
execute if score ai wander.data matches -2 run scoreboard players set current_phase wander.song 4
