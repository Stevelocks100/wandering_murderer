execute as @n[tag=aj.wander.root,type=item_display] unless entity @s[tag=aj.wander.animation.angry_idle.playing] run function aj:wander/animations/angry_idle/tween {to_frame:0,duration:2}
attribute @s movement_speed base set 1.2
function wander:ai/pathfind_macro {target:'@p[tag=wander.target]'}
execute if entity @p[tag=wander.target,distance=0..3] run tp @s @p[tag=wander.target]
execute if entity @p[tag=wander.target,distance=0..3] run scoreboard players set sided.goto wander.data 0