scoreboard players add @s wander.whey 1

execute unless function wander:whey/still_has_attributes run function wander:whey/remove

execute if score @s wander.whey matches 3000 run function wander:whey/smaller

execute if score @s wander.whey matches 3600.. run function wander:whey/remove