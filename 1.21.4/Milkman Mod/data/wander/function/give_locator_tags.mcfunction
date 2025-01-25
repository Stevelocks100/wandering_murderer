execute if entity @s[tag=wander.given_tags] run return 0
data modify storage wander:temp locators.lefthand set from entity @s data.locators.lefthand.uuid
data modify storage wander:temp locators.righthand set from entity @s data.locators.righthand.uuid
data modify storage wander:temp locators.chest set from entity @s data.locators.chest.uuid
data modify storage wander:temp locators.sack set from entity @s data.locators.sack.uuid
function wander:give_locator_tags2 with storage wander:temp locators
tag @s add wander.given_tags