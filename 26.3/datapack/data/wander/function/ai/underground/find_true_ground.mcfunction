kill @e[tag=wander.true_ground]
scoreboard players set execution_amount wander.temp 300
execute positioned over motion_blocking_no_leaves run function wander:ai/underground/find_true_ground2