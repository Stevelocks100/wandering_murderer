tag @s add wander.near_trading_stand

advancement grant @s only wander:story/trading_stand

attribute @s block_interaction_range modifier add wander:trading_stand -2 add_multiplied_total
execute unless score daytime wander.data matches -499.. run effect give @s weakness infinite 10 true

execute unless score daytime wander.data matches -499.. run title @s times 0 60 20
execute unless score daytime wander.data matches -499.. run title @s actionbar {text:"A sense of safety washes over you...",color:"green"}