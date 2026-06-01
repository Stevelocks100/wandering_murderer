# Generated with MC-Build

playsound wander:phase3.emerald_hum hostile @a[distance=0..] ~ ~ ~ 20.0 1.0 1.0
function aj:fine_print/variants/default/apply
function aj:fine_print/variants/invisible/apply
tag @r[tag=wander.trader_dimension.must_check,distance=0..] add wander.trader_dimension.scan_target
tag @p[tag=wander.trader_dimension.scan_target] remove wander.trader_dimension.must_check
execute facing entity @p[tag=wander.trader_dimension.scan_target,distance=0..] eyes at @p[tag=wander.trader_dimension.scan_target,distance=0..] positioned over motion_blocking positioned ~ ~20 ~ run tp @s ~ ~ ~ ~ 0