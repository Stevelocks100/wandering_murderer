execute unless entity @n[tag=tower.tester] run summon marker ~ ~ ~ {Tags:["tower.tester"]}


execute as @n[tag=tower.tester] at @s unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_amount tower.temp 1
execute as @n[tag=tower.tester] at @s unless block ~ ~ ~ #wander:motion_ish run scoreboard players set tick tower.temp 20
execute as @n[tag=tower.tester] at @s unless block ~ ~ ~ #wander:motion_ish run tp @s @p[tag=tower.player]
scoreboard players remove tick tower.temp 1
execute if score tick tower.temp matches ..0 if score tower_amount tower.temp matches 1.. run scoreboard players remove tower_amount tower.temp 1
execute if score tick tower.temp matches ..0 run scoreboard players set tick tower.temp 20

execute if entity @s[nbt={OnGround:1b}] align xyz positioned ~0.5 ~ ~0.5 run tp @n[tag=tower.tester] ~ ~ ~

execute if score tower_amount tower.temp matches 3.. run scoreboard players set tick tower.temp 100
execute if score tower_amount tower.temp matches 3.. run tag @s add tower.success
execute if score tower_amount tower.temp matches 3.. run tag @s remove tower.player