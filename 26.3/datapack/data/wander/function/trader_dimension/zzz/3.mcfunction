# Generated with MC-Build

execute if entity @p[distance=0..20] unless entity @n[tag=aj.wander_chest.root,type=item_display,distance=0..2] run function aj:wander_chest/summon {args:{animation:'idle',start_animation:true}}
execute unless entity @p[distance=0..20] if entity @n[tag=aj.wander_chest.root,type=item_display,distance=0..2] as @n[tag=aj.wander_chest.root,type=item_display,distance=0..2] run function aj:wander_chest/remove/this