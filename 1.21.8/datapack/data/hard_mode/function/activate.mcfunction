advancement revoke @s only hard_mode:activate
execute if score hard_mode wander.data matches 1 run return 0
execute if score daytime wander.data matches 24000.. run return 0
function hard_mode:init
playsound entity.lightning_bolt.thunder hostile @a ~ ~ ~ 999.0 1.4 1.0
title @a times 0 40 20
title @a actionbar "The Trader's Onslaught has begun..."
clear @s beetroot_soup[custom_data={whey:1b}] 1