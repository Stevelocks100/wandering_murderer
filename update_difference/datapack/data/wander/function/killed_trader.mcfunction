advancement revoke @s only wander:killed_trader
execute if score daytime wander.data matches -500.. run return 0
function wander:initiate
playsound entity.lightning_bolt.thunder player @a ^ ^ ^100 100000000 0.8 1.0