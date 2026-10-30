# Generated with MC-Build

scoreboard objectives add wander.music dummy
scoreboard objectives add wander.music.tps dummy
scoreboard objectives add wander.music.time dummy
scoreboard objectives add wander.music.current_song dummy
scoreboard objectives add wander.music.max_time dummy
data modify storage wander:music song_data set value []
data modify storage wander:music song_data append value {duration:548,sound:"wander:wandering_murderer.phase1"}
data modify storage wander:music song_data append value {duration:548,sound:"wander:wandering_murderer.phase2"}
data modify storage wander:music song_data append value {duration:411,sound:"wander:wandering_murderer.phase3"}
data modify storage wander:music song_data append value {duration:548,sound:"wander:wandering_murderer.phase1_slaughterer"}
data modify storage wander:music song_data append value {duration:549,sound:"wander:wandering_murderer.phase2_slaughterer"}
data modify storage wander:music song_data append value {duration:548,sound:"wander:wandering_murderer.phase3_slaughterer"}
data modify storage wander:music song_data append value {duration:274,sound:"wander:wandering_murderer.slaughterer_intro"}
data modify storage wander:music song_data append value {duration:273,sound:"wander:wandering_murderer.phase3_slaughterer_bridge"}
data modify storage wander:music song_data append value {duration:172,sound:"wander:wandering_murderer.ending"}
data modify storage wander:music song_data append value {duration:172,sound:"wander:wandering_murderer.slaughterer_ending"}
execute unless data storage wander:music per_player run data modify storage wander:music per_player set value []