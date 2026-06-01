# Generated with MC-Build

function aj:wander_chest/remove/all
kill @e[tag=aj.wander_chest.node]
execute in wander:pocket as @e[tag=wander.trader_dimension.spawn,distance=0..] at @s run function aj:wander_chest/summon {args:{animation:'idle',start_animation:true}}