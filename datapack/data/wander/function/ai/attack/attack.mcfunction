execute if score sword wander.attack_cooldown matches ..0 run scoreboard players set attack_cd wander.data 30
execute if score sword wander.attack_cooldown matches ..0 run function wander:ai/attacks/sword_swipe_init
execute if score attack_cd wander.data matches 30 run scoreboard players remove timer wander.data 100
execute if score attack_cd wander.data matches 30 run return 1


execute if score punch wander.attack_cooldown matches ..0 run scoreboard players set attack_cd wander.data 30
execute if score punch wander.attack_cooldown matches ..0 run function wander:ai/attacks/punch_init
execute if score attack_cd wander.data matches 30 run scoreboard players remove timer wander.data 100
execute if score attack_cd wander.data matches 30 run return 1


execute if score stew wander.attack_cooldown matches ..0 run scoreboard players set attack_cd wander.data 30
execute if score stew wander.attack_cooldown matches ..0 run function wander:ai/attacks/stew_init
execute if score attack_cd wander.data matches 30 run scoreboard players remove timer wander.data 100
execute if score attack_cd wander.data matches 30 run return 1


execute store result score abduct_random wander.data run random value 1..20
execute if score hard_mode wander.data matches 1 store result score abduct_random wander.data run random value 1..8

execute if score abduct_random wander.data matches 4 run function wander:ai/attacks/quick_abduct_init
scoreboard players set attack_cd wander.data 30