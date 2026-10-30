function wander:trading_stand/item/deactivate
execute on passengers if entity @s[type=interaction] run data merge entity @s {width:0,height:0}
data merge entity @s {transformation:{scale:[0,0,0]},start_interpolation:1,interpolation_duration:10}