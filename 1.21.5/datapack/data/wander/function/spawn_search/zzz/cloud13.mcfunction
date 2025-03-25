data modify entity @s Duration set value 0
execute positioned over ocean_floor unless entity @s[distance=0..1] run return fail
