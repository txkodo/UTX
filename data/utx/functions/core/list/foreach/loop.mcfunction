data modify storage utx:api in set from storage utx:core list.foreach.reversed[-1]
$function $(function)
data remove storage utx:core list.foreach.reversed[-1]
execute if data storage utx:core list.foreach.reversed[0] run function utx:core/list/foreach/loop with storage utx:core list.foreach.arg