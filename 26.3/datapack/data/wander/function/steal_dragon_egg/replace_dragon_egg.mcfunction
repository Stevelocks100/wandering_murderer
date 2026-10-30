execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon item_display ~ ~ ~ {Tags:["wander.dragon_egg","wander.entity"],item:{id:"dragon_egg",count:1}}
setblock ~ ~ ~ air strict
execute if score command_block_gamerule wander.data matches 1 run gamerule command_block_output true
execute if score block_work_gamerule wander.data matches 0 run gamerule command_blocks_work false
