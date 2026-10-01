# Data Manager: Prepare for Read / Write
execute store result storage animated_java:temp args.id int 1 run scoreboard players get @s aj.id
# Data Manager: Write
function animated_java:global/data_manager/write with storage animated_java:temp args
