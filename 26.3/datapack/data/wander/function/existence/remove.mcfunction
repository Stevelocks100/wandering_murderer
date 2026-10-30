execute unless score daytime wander.data matches ..-1 if score bad_omen wander.data matches 1 unless entity @s[type=player] if score health wander.data matches 1.. run return 0

advancement revoke @a only wander:story/one_attempt


execute if score daytime wander.data matches -501 run function wander:add_resonance_trade
execute if score daytime wander.data matches -501 run scoreboard players set bad_omen_strength wander.data 0

stopsound @a * wander:wandering_murderer.phase1
stopsound @a * wander:wandering_murderer.phase2
stopsound @a * wander:wandering_murderer.phase3

function aj:fine_print/remove/all

execute if score daytime wander.data matches -501 run scoreboard players set bad_omen wander.data 0

summon marker ~ ~ ~ {Tags:["wander.no_credit","wander.entity"]}
damage 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f 1 mob_attack by @n[tag=wander.no_credit]
damage abb5e532-ba94-447e-8b50-7b463008a14c 1 mob_attack by @n[tag=wander.no_credit]
kill @e[tag=wander.no_credit]
tag 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f add wander.despawning
tag 272f8e76-f6fe-4b87-a609-8fcf54a8cb1f remove wander.hitbox
scoreboard players add @p[tag=wander.target] wander.encounters 1
kill @n[tag=wander.sword_int]
tp @e[tag=wander] ~ ~-1000 ~
kill @e[tag=wander]
tp @e[tag=wander.despawning] ~ ~-1000 ~
kill @e[tag=wander.despawning]

function aj:wander/remove/all

#execute if entity @s[type=player] run return 0
scoreboard players operation new_spawn_time wander.data = timer wander.data
execute store result score new_random_time wander.data run random value 3000..8000
scoreboard players operation new_spawn_time wander.data += new_random_time wander.data
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
#execute if score new_spawn_time wander.data < timer wander.data run scoreboard players add new_spawn_time wander.data 1000
