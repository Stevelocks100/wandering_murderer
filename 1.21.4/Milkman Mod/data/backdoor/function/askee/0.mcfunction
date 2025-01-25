tag @s remove backdoor.askee_active

#tellraw @a [{"text":""},{"nbt":"askee_string","storage":"backdoor:temp"},{"text":"\n"},{"nbt":"askee_char","storage":"backdoor:temp"},{"text":"\n"},{"nbt":"askee_final","storage":"backdoor:temp"}]

data modify storage backdoor:temp askee_char set string storage backdoor:temp askee_string 0 2
data modify storage backdoor:temp askee_string set string storage backdoor:temp askee_string 2
function backdoor:askee/0_1 with storage backdoor:temp
function backdoor:askee/0_2 with storage backdoor:temp

execute if data storage backdoor:temp {askee_string:''} run return 0
execute if data storage backdoor:temp {askee_string:""} run return 0
function backdoor:askee/0