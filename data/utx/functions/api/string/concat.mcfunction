#> utx:api/string/concat
#  
# 文字列を結合
# 
# @input storage utx:api in :: List[String]
# @output storage utx:api out :: String
# @api

data modify storage utx:core string.concat.temp set from storage utx:api in
data modify storage utx:api in set value {quoted:false}
data modify storage utx:api in.values set from storage utx:core string.concat.temp
function utx:api/string/escape

data modify storage utx:core string.concat.loop.concat set value ""
data modify storage utx:core string.concat.loop.last set from storage utx:api out[-1]
execute if data storage utx:api out[-1] run function utx:core/string/concat/loop with storage utx:core string.concat.loop

data modify storage utx:api out set from storage utx:core string.concat.loop.concat
data remove storage utx:api in
