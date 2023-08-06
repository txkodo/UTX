#> utx:api/list/foreach
# 
# foreach
#
# @input storage utx:api in.values :: List[T] リスト
# @input storage utx:api in.function :: String 適用する関数（T -> void）
# @api

data modify storage utx:core list.foreach.arg.function set from storage utx:api in.function
data modify storage utx:api in set from storage utx:api in.values
function utx:api/list/reverse
data modify storage utx:core list.foreach.reversed set from storage utx:api out

execute if data storage utx:core list.foreach.reversed[0] run function utx:core/list/foreach/loop with storage utx:core list.foreach.arg