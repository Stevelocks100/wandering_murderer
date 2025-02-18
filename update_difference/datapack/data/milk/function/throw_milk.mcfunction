advancement revoke @s only milk:throw_milk
scoreboard players add @s milk.puddle 0
execute unless score @s milk.puddle matches ..0 run scoreboard players add @s milk.puddle 1
execute unless score @s milk.puddle matches ..0 run return 0
item modify entity @s[predicate=milk:mainhand_milk,gamemode=!creative,gamemode=!spectator] weapon.mainhand crafting:one_less
item modify entity @s[predicate=milk:offhand_milk,gamemode=!creative,gamemode=!spectator] weapon.mainhand crafting:one_less
function milk:summon

scoreboard players add @s milk.puddle 2