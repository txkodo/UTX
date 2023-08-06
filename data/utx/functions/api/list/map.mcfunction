#> utx:api/list/map
# 
# リストの各要素に関数を適用
#
# @input storage utx:api in.values :: List[T] リスト
# @input storage utx:api in.function :: String 適用する関数（T -> U）
# @output storage utx:api out :: List[U]
# @api

data modify storage utx:core list.map.arg.function set from storage utx:api in.function
data modify storage utx:api in set from storage utx:api in.values
function utx:api/list/reverse
data modify storage utx:core list.map.reversed set from storage utx:api out
data modify storage utx:core list.map.result set value []

execute if data storage utx:core list.map.reversed[0] run function utx:core/list/map/loop with storage utx:core list.map.arg

data modify storage utx:api out set from storage utx:core list.map.result
