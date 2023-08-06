#> utx:api/string/escape
#  
# 文字列をエスケープ
# 
# @input storage utx:api in.value :: String エスケープしたい文字列
# @input storage utx:api in.quoted :: 1b|0b = 0b エスケープ結果を"/'で囲むかどうか (囲い文字が"になるか'になるかは指定できない)
# @output storage utx:api out :: List[String]
# @api

data modify storage utx:core string.escape.resolve set value '{ "storage": "utx:api", "nbt": "in", "interpret": false }'
function utx:api/string/resolve

execute if data storage utx:api in{quoted:1b} run data modify storage utx:api out set string storage utx:api out 8 -1
execute unless data storage utx:api in{quoted:1b} run data modify storage utx:api out set string storage utx:api out 9 -2

data remove storage utx:api in
