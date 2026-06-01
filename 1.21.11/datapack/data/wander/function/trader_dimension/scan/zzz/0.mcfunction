# Generated with MC-Build

scoreboard players remove scan_timer wander.trader_dimension 1
scoreboard players operation scan_seconds wander.trader_dimension = scan_timer wander.trader_dimension
scoreboard players set 20 wander.trader_dimension 20
scoreboard players operation scan_seconds wander.trader_dimension /= 20 wander.trader_dimension
scoreboard players operation scan_ticks wander.trader_dimension = scan_timer wander.trader_dimension
scoreboard players set 20 wander.trader_dimension 20
scoreboard players operation scan_ticks wander.trader_dimension %= 20 wander.trader_dimension
execute if score scan_timer wander.trader_dimension matches 218 as @a[distance=0..] at @s run playsound wander:pocket.tick hostile @s ~ ~ ~ 1.0 1.0 1.0
execute if score scan_seconds wander.trader_dimension matches 7.. if score scan_ticks wander.trader_dimension matches 0 as @a[distance=0..] at @s run playsound wander:pocket.tick hostile @s ~ ~ ~ 1.0 0.86 1.0
execute if score scan_seconds wander.trader_dimension matches 4..6 if score scan_ticks wander.trader_dimension matches 0 as @a[distance=0..] at @s run playsound wander:pocket.tick hostile @s ~ ~ ~ 1.0 0.7 1.0
execute if score scan_seconds wander.trader_dimension matches 0..3 if score scan_ticks wander.trader_dimension matches 0 as @a[distance=0..] at @s run playsound wander:pocket.tick hostile @s ~ ~ ~ 1.0 0.5 1.0
title @a[distance=0..] times 0 20 1
title @a[distance=0..] actionbar ["",{color:"dark_red",text:"Find cover in ",extra:[{score:{name:"scan_seconds",objective:"wander.trader_dimension"}}," seconds."]}]
execute unless score scan_timer wander.trader_dimension matches 1.. run title @a[distance=0..] actionbar ["",{color:"dark_red",text:"Hide."}]