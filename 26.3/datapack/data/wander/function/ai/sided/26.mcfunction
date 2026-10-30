#joke, for sided's video
#this behaviour will immediately run to sided

scoreboard players set timer wander.data 100000

execute if score sided.dancing wander.data matches 1 run return run function wander:ai/sided/dance
execute if score sided.jump wander.data matches 1 run return run function wander:ai/sided/jump
execute if score sided.goto wander.data matches 1 run return run function wander:ai/sided/goto

execute store result score health wander.data run bossbar get wander:health max

function wander:ai/sided/nothing