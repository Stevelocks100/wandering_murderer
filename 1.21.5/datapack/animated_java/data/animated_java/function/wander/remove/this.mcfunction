# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
function #animated_java:wander/as_root/on_remove
execute on passengers if entity @s[tag=aj.global.data] run function animated_java:wander/remove/zzz/0
execute on passengers run kill @s
kill @s