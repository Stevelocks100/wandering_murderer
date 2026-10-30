data merge storage milk:gu_temp {0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,a:0,b:0,c:0,d:0,e:0,f:0}
$data modify storage milk:gu_main in set value $(UUID)

execute store result score 0= gu.main store result score 1= gu.main run data get storage milk:gu_main in[0]
execute store result storage milk:gu_temp 0 int 1 run scoreboard players operation 0= gu.main %= 256 num
execute store result score 2= gu.main run scoreboard players operation 1= gu.main /= 256 num
execute store result storage milk:gu_temp 1 int 1 run scoreboard players operation 1= gu.main %= 256 num
execute store result score 3= gu.main run scoreboard players operation 2= gu.main /= 256 num
execute store result storage milk:gu_temp 2 int 1 run scoreboard players operation 2= gu.main %= 256 num
execute store result storage milk:gu_temp 3 int 1 run scoreboard players operation 3= gu.main /= 256 num

execute store result score 0= gu.main store result score 1= gu.main run data get storage milk:gu_main in[1]
execute store result storage milk:gu_temp 4 int 1 run scoreboard players operation 0= gu.main %= 256 num
execute store result score 2= gu.main run scoreboard players operation 1= gu.main /= 256 num
execute store result storage milk:gu_temp 5 int 1 run scoreboard players operation 1= gu.main %= 256 num
execute store result score 3= gu.main run scoreboard players operation 2= gu.main /= 256 num
execute store result storage milk:gu_temp 6 int 1 run scoreboard players operation 2= gu.main %= 256 num
execute store result storage milk:gu_temp 7 int 1 run scoreboard players operation 3= gu.main /= 256 num

execute store result score 0= gu.main store result score 1= gu.main run data get storage milk:gu_main in[2]
execute store result storage milk:gu_temp 8 int 1 run scoreboard players operation 0= gu.main %= 256 num
execute store result score 2= gu.main run scoreboard players operation 1= gu.main /= 256 num
execute store result storage milk:gu_temp 9 int 1 run scoreboard players operation 1= gu.main %= 256 num
execute store result score 3= gu.main run scoreboard players operation 2= gu.main /= 256 num
execute store result storage milk:gu_temp a int 1 run scoreboard players operation 2= gu.main %= 256 num
execute store result storage milk:gu_temp b int 1 run scoreboard players operation 3= gu.main /= 256 num

execute store result score 0= gu.main store result score 1= gu.main run data get storage milk:gu_main in[3]
execute store result storage milk:gu_temp c int 1 run scoreboard players operation 0= gu.main %= 256 num
execute store result score 2= gu.main run scoreboard players operation 1= gu.main /= 256 num
execute store result storage milk:gu_temp d int 1 run scoreboard players operation 1= gu.main %= 256 num
execute store result score 3= gu.main run scoreboard players operation 2= gu.main /= 256 num
execute store result storage milk:gu_temp e int 1 run scoreboard players operation 2= gu.main %= 256 num
execute store result storage milk:gu_temp f int 1 run scoreboard players operation 3= gu.main /= 256 num

function milk:gu/zzz/get_hexes with storage milk:gu_temp
function milk:gu/zzz/concat_uuid with storage milk:gu_temp