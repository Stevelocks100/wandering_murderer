# Generated with MC-Build

scoreboard players remove timer wander.fine_print 1
tag @a[tag=wander.fine_print.target] remove wander.fine_print.target
execute if score timer wander.fine_print matches 0 run function wander:fine_print/ai/zzz/0