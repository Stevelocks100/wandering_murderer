# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.trader_dimension.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'trader_dimension', 'function_path': 'animated_java:trader_dimension/animations/pause_all'}
tag @s remove aj.trader_dimension.animation.trees.playing
tag @s remove aj.trader_dimension.animation.open_chest.playing
tag @s remove aj.trader_dimension.animation.close_chest.playing