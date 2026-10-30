# Generated with MC-Build

scoreboard players set scan_active wander.trader_dimension 0
playsound wander:phase3.emerald_stop hostile @a[x=0] 0 0 0 20.0 1.4 1.0
playsound wander:phase3.emerald_stop hostile @a[x=0] 0 0 0 20.0 1.4 1.0
playsound wander:phase3.emerald_stop hostile @a[x=0] 0 0 0 20.0 1.4 1.0
tag @a remove wander.trader_dimension.must_check
tag @a remove wander.trader_dimension.scan_target
execute as @n[tag=aj.fine_print.root,x=0] run function aj:fine_print/animations/pocket_leave/play