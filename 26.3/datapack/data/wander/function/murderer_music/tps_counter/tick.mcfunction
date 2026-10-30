# Generated with MC-Build

scoreboard players add timer1 wander.music.tps 1
scoreboard players add timer2 wander.music.tps 1
# execute store result score watch1 <%prefix%>.tps run stopwatch query <%namespace%>/timer1 10
# execute store result score watch2 <%prefix%>.tps run stopwatch query <%namespace%>/timer2 10
execute if score timer1 wander.music.tps matches 74.. run function wander:murderer_music/tps_counter/zzz/0
execute if score timer2 wander.music.tps matches 74.. run function wander:murderer_music/tps_counter/zzz/1
execute store result storage wander:music gm.scoreboard float 1 run scoreboard players get timer1 wander.music.tps
execute store result storage wander:music gm.stopwatch float 0.01 run stopwatch query wander:music/timer1 100
data modify storage wander:music gm.tps_1 set compute default float wander:tps
execute store result storage wander:music gm.scoreboard float 1 run scoreboard players get timer2 wander.music.tps
execute store result storage wander:music gm.stopwatch float 0.01 run stopwatch query wander:music/timer2 100
data modify storage wander:music gm.tps_2 set compute default float wander:tps
execute if score timer1 wander.music.tps matches 37.. run data modify storage wander:music tps set from storage wander:music gm.tps_1
execute if score timer2 wander.music.tps matches 37.. run data modify storage wander:music tps set from storage wander:music gm.tps_2
execute store result score tps wander.music.tps run data get storage wander:music tps