# Generated with MC-Build

$execute as @p[nbt={UUID:$(UUID)}] at @s run return run function wander:fine_print/give_item_back
$execute unless entity @p[nbt={UUID:$(UUID)}] run function wander:fine_print/cycle_per_player