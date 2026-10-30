execute on passengers if entity @s[type=interaction] run data merge entity @s {width:0.5,height:1}
data merge entity @s {transformation:{scale:[1,1,1]},start_interpolation:1,interpolation_duration:1}
execute store result score @s wander.rotation_velocity run random value 20..100
