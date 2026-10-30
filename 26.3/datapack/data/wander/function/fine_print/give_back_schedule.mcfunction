# Generated with MC-Build

schedule function wander:fine_print/give_back_schedule 5s replace
execute unless score daytime wander.data matches -501 run return 0
execute if entity @n[tag=aj.fine_print.root,x=0] run return 0
execute if entity abb5e532-ba94-447e-8b50-7b463008a14c run return 0
execute unless data storage wander:fine_print per_player[0] run return 0
execute unless data storage wander:fine_print per_player[0].stolen_items[0] run return run function wander:fine_print/cycle_per_player
function wander:fine_print/zzz/0 with storage wander:fine_print per_player[0]