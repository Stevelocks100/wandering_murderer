# Generated with MC-Build

scoreboard objectives add wander.fine_print dummy
execute unless data storage wander:fine_print per_player run data modify storage wander:fine_print per_player set value []
schedule function wander:fine_print/give_back_schedule 5s replace