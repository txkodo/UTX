#> utx:api/string/slice
#  
# 文字列をスライス
# 
# @input  storage utx:api in.value :: String 元の文字列
# @input  storage utx:api in.start? :: Int スライスの開始インデックス(負値もOK)(スライスに含める)
# @input  storage utx:api in.end? :: Int スライスの終了インデックス(負値もOK)(スライスに含めない)
# @output storage utx:api out :: String
# @api

execute unless data storage utx:api in.start run data modify storage utx:api in.start set value 0
execute if data storage utx:api in.end run function utx:core/string/slice/with_end with storage utx:api in
execute unless data storage utx:api in.end run function utx:core/string/slice/no_end with storage utx:api in
data remove storage utx:api in
