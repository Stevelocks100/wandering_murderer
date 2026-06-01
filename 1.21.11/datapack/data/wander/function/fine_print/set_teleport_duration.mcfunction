# Generated with MC-Build

execute store result storage animated_java:temp args.id int 1 run scoreboard players get @s aj.id
function animated_java:global/data_manager/read with storage animated_java:temp args
data modify storage wander:fine_print macro.teleport set from storage animated_java:temp entry.data.uuids_by_name
$data modify storage wander:fine_print macro.teleport.duration set value $(duration)
function wander:fine_print/zzz/17 with storage wander:fine_print macro.teleport