execute if entity @s[tag=wander.force_kidnap] run scoreboard players set sword wander.attack_cooldown 1
execute if entity @s[tag=wander.force_kidnap] run scoreboard players set punch wander.attack_cooldown 1

execute if score sword wander.attack_cooldown matches ..0 unless entity @s[tag=wander.threw_sword] run scoreboard players set attack_cd wander.data 20
execute if score sword wander.attack_cooldown matches ..0 unless entity @s[tag=wander.threw_sword] run function wander:ai/attacks/sword_swipe_init
execute if score attack_cd wander.data matches 20 run scoreboard players remove timer wander.data 25
execute if score attack_cd wander.data matches 20 run return 1


execute if score punch wander.attack_cooldown matches ..0 run scoreboard players set attack_cd wander.data 40
execute if score punch wander.attack_cooldown matches ..0 run function wander:ai/attacks/punch_init
execute if score attack_cd wander.data matches 40 run scoreboard players remove timer wander.data 25
execute if score attack_cd wander.data matches 40 run return 1


execute store result score abduct_random wander.data run random value 1..13
execute if score bad_omen wander.data matches 1 store result score abduct_random wander.data run random value 1..11
execute if score bad_omen wander.data matches 1 if entity @n[tag=wander.phase3.wall] store result score abduct_random wander.data run random value 1..18

execute if entity @s[tag=wander.force_kidnap] run scoreboard players set abduct_random wander.data 4
execute if entity @s[tag=wander.force_kidnap] run scoreboard players set kidnap wander.attack_cooldown 0
execute if score kidnap wander.attack_cooldown matches 1.. run return 0
execute if score abduct_random wander.data matches 4 if score do_kidnapping milk.settings matches 1 run function wander:ai/attacks/quick_abduct_init
scoreboard players set attack_cd wander.data 30
execute if score abduct_random wander.data matches 4 run scoreboard players set kidnap wander.attack_cooldown 400
execute if score abduct_random wander.data matches 4 run return 0
scoreboard players remove punch wander.attack_cooldown 50
scoreboard players remove sword wander.attack_cooldown 50