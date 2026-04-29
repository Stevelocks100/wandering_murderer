## This function will run on every block in the area. Put whatever you want here! :)

execute if entity @s[tag=wander.ai] if function wander:water_ish_block run scoreboard players set water_check wander.temp 1

execute if entity @s[tag=wander.ice_proj] if function wander:water_ish_block run summon marker ~ ~ ~ {Tags:["wander.ice_spread"]}
execute if entity @s[tag=wander.ice_proj] if function wander:water_ish_block run scoreboard players add ice_spread wander.data 20
execute if entity @s[tag=wander.ice_proj_display] if function wander:water_ish_block run summon marker ~ ~ ~ {Tags:["wander.ice_spread"]}
execute if entity @s[tag=wander.ice_proj_display] if function wander:water_ish_block run scoreboard players add ice_spread wander.data 20
