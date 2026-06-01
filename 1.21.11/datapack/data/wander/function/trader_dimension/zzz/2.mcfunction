# Generated with MC-Build

function animated_java:wander_chest/remove/all
kill @e[tag=aj.wander_chest.node,distance=0..]
tp @e[type=item,distance=0..] @n[tag=wander.ai]