execute if score do_digging milk.settings matches 1 run tellraw @s [{"text":""},{"text":"[HEAVILY EXPERIMENTAL] Do Digging: ","color":"white","clickEvent":{"action":"run_command","value":"/function milk:settings/toggle/do_digging"},"hoverEvent":{"action":"show_text","contents":[{"text":"Whether it will dig towards you. Warning! This is very destructive and highly unstable!","color":"gold"}]}},{"text":"[TRUE]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/function milk:settings/toggle/do_digging"},"hoverEvent":{"action":"show_text","contents":[{"text":"Whether it will dig towards you. Warning! This is very destructive and highly unstable!","color":"gold"}]}}]
execute if score do_digging milk.settings matches -1 run tellraw @s [{"text":""},{"text":"[HEAVILY EXPERIMENTAL] Do Digging: ","color":"white","clickEvent":{"action":"run_command","value":"/function milk:settings/toggle/do_digging"},"hoverEvent":{"action":"show_text","contents":[{"text":"Whether it will dig towards you. Warning! This is very destructive and highly unstable!","color":"gold"}]}},{"text":"[FALSE]","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/function milk:settings/toggle/do_digging"},"hoverEvent":{"action":"show_text","contents":[{"text":"Whether it will dig towards you. Warning! This is very destructive and highly unstable!","color":"gold"}]}}]