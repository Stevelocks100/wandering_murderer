function wander:reset_values
scoreboard players set daytime wander.data 48000
scoreboard players set defeated wander.data 0
scoreboard players set health wander.data 700
bossbar set wander:health max 700
scoreboard players set days_passed wander.data 0
title @a times 0 40 20
title @a actionbar "Survive for 2 days..."
