data modify storage utx:api in.accum set from storage utx:api out
data modify storage utx:api in.value set from storage utx:core list.reduce.reversed[-1]
$function $(function)

data remove storage utx:core list.reduce.reversed[-1]
execute if data storage utx:core list.reduce.reversed[0] run function utx:core/list/reduce/loop with storage utx:core list.reduce.arg