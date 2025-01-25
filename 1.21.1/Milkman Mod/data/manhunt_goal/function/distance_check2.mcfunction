$execute positioned 0.0 0.0 0.0 rotated 0 0 facing ^-$(a_player) ^ ^$(b_player) run tp @s ^$(a_player) ^ ^$(b_player) 0 0
data modify storage manhunt_goal:temp result.player set from entity @s Pos[2]
execute store result storage manhunt_goal:temp result.int int 1 run data get storage manhunt_goal:temp result.player 1

#$execute positioned 0.0 0.0 0.0 rotated 0 0 facing ^-$(a_target) ^ ^$(b_target) run tp @s ^$(a_target) ^ ^$(b_target) 0 0
#data modify storage manhunt_goal:temp result.target set from entity @s Pos[2]