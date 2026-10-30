# Generated with MC-Build

execute if entity @s[tag=aj.fine_print.animation.bring_item.playing] run function wander:fine_print/to_bag
execute if entity @s[tag=aj.fine_print.animation.loop.playing] run function wander:fine_print/to_bag
execute if score ai wander.data matches 21 if score bad_omen wander.data matches 1 run scoreboard players add timer wander.fine_print 1
scoreboard players remove timer wander.fine_print 1
execute if score timer wander.fine_print matches ..0 if entity @p[tag=wander.target,distance=0..15] run return run function wander:fine_print/ai/zzz/1