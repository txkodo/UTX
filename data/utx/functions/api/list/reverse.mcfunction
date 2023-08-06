#> utx:api/list/map
#  
# リストを反転
# 
# @input storage utx:api in :: List[T] リスト
# @output storage utx:api out :: List[T]
# @api

data modify storage utx:api out set value []

execute if data storage utx:api in[-1] run function utx:core/list/reverse/

data remove storage utx:api in