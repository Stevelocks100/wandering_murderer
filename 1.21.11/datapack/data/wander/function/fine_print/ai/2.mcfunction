# Generated with MC-Build

scoreboard players remove timer wander.fine_print 1
execute if entity @p[tag=wander.fine_print.target,tag=!wander.target] run function wander:fine_print/ai/zzz/2
execute if score timer wander.fine_print matches 0 run function wander:fine_print/ai/zzz/3