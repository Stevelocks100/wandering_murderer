# Generated with MC-Build

execute if entity @n[tag=aj.fine_print.root,type=item_display,distance=0..] run return 0
scoreboard players set ai wander.fine_print 0
execute at @n[tag=aj.wander.root] run function animated_java:fine_print/summon {args:{animation:'spawn',start_animation:false}}
function wander:fine_print/appear
execute store result score timer wander.fine_print run random value 200..400
schedule function wander:fine_print/zzz/3 3s replace