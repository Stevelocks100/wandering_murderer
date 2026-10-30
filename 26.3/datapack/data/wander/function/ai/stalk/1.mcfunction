execute unless score dance_chance wander.data matches 10..12 as @n[tag=aj.wander.root,type=item_display] unless entity @s[tag=aj.wander.animation.sneak_idle.playing] run function aj:wander/animations/sneak_idle/tween {to_frame:0,duration:2}
execute if score dance_chance wander.data matches 10 run function wander:ai/anim_states/macarena
execute if score dance_chance wander.data matches 11 run function wander:ai/anim_states/gangnam
execute if score dance_chance wander.data matches 12 run function wander:ai/anim_states/twirl

attribute @s movement_speed base set 0.0
execute facing entity @p[tag=wander.target] eyes run tp @n[tag=aj.wander.root,type=item_display] ~ ~ ~ ~ 0
scoreboard players remove standoff wander.data 1
execute if score standoff wander.data matches ..0 as @p[tag=wander.target] run function wander:ai/stalk/noticed
