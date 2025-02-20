# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.wander.root] run return 0
function #animated_java:wander/as_root/pre_tick
execute if entity @s[tag=aj.wander.animation.sneak_idle.playing] run function animated_java:wander/animations/sneak_idle/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.sneak_walk.playing] run function animated_java:wander/animations/sneak_walk/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.swim.playing] run function animated_java:wander/animations/swim/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.swim_idle.playing] run function animated_java:wander/animations/swim_idle/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.angry_run.playing] run function animated_java:wander/animations/angry_run/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.sword_throw.playing] run function animated_java:wander/animations/sword_throw/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.ice_throw.playing] run function animated_java:wander/animations/ice_throw/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.stew_throw.playing] run function animated_java:wander/animations/stew_throw/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.sword_throw_backup.playing] run function animated_java:wander/animations/sword_throw_backup/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.angry_run_sword.playing] run function animated_java:wander/animations/angry_run_sword/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.sword_swipe.playing] run function animated_java:wander/animations/sword_swipe/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.give_sword1.playing] run function animated_java:wander/animations/give_sword1/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.give_sword2.playing] run function animated_java:wander/animations/give_sword2/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.punch.playing] run function animated_java:wander/animations/punch/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.abduct.playing] run function animated_java:wander/animations/abduct/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.macarena.playing] run function animated_java:wander/animations/macarena/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.twirl.playing] run function animated_java:wander/animations/twirl/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.gangnamstyle.playing] run function animated_java:wander/animations/gangnamstyle/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.drink_potion_slow.playing] run function animated_java:wander/animations/drink_potion_slow/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.drink_potion_quick.playing] run function animated_java:wander/animations/drink_potion_quick/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.jump_to_sword.playing] run function animated_java:wander/animations/jump_to_sword/zzz/on_tick
execute if entity @s[tag=aj.wander.animation.angry_idle.playing] run function animated_java:wander/animations/angry_idle/zzz/on_tick
execute on passengers if entity @s[tag=aj.wander.data] run function animated_java:wander/root/zzz/0
execute at @s on passengers run rotate @s ~ ~
function #animated_java:wander/as_root/post_tick