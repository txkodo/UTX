#> utx:api/list/map
# 
# リストをreduce
#
# @input storage utx:api in.values :: List[T] リスト
# @input storage utx:api in.function :: String 適用する関数({accum:U,value:T} -> U)
# @input storage utx:api in.init :: U accumの初期値
# @output storage utx:api out :: List[U]
# @api

data modify storage utx:core list.reduce.arg.function set from storage utx:api in.function
data modify storage utx:core list.reduce.init set from storage utx:api in.init
data modify storage utx:api in set from storage utx:api in.values
function utx:api/list/reverse
data modify storage utx:core list.reduce.reversed set from storage utx:api out

data modify storage utx:api out set from storage utx:core list.reduce.init
execute if data storage utx:core list.reduce.reversed[0] run function utx:core/list/reduce/loop with storage utx:core list.reduce.arg