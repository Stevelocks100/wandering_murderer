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


