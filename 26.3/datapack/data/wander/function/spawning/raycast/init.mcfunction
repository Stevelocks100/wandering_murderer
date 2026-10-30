# Generated with MC-Build

kill @e[tag=wander.potential_spawn,x=0,type=item_display]
# do the rest of the recursion agony.
# repeat for 5° increments (aka 72 times)
# 30 blocks away, positioned 2 blocks above surface no leaves.
# first check if it is within player LOS (120 fov). if not, continue.
# do a raycast to find the first position that is blocked from player sight (aka block raycast)
# make sure this position isn't somewhere that's on water/underwater
# this is where a potential spawn marker will appear.
execute positioned ~ ~2 ~ run function wander:spawning/raycast/zzz/0