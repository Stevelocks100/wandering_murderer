# Generated with MC-Build

$data modify storage wander:fine_print per_player[{UUID:$(UUID)}] set from storage wander:fine_print current
$execute unless data storage wander:fine_print current.stolen_items[0] run data remove storage wander:fine_print per_player[{UUID:$(UUID)}]