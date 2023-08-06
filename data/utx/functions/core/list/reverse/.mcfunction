data modify storage utx:api out append from storage utx:api in[-1]
data remove storage utx:api in[-1]
execute if data storage utx:api in[-1] run function utx:core/list/reverse/