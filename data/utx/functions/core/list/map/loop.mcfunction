data modify storage utx:api in set from storage utx:core list.map.reversed[-1]
$function $(function)
data modify storage utx:core list.map.result append from storage utx:api out

data remove storage utx:core list.map.reversed[-1]

execute if data storage utx:core list.map.reversed[0] run function utx:core/list/map/loop with storage utx:core list.map.arg