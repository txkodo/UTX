execute unless entity @s run return run data remove storage utx:core function.schedule.in.executor
execute if data storage utx:core function.schedule.in{executor:0b} run return run data remove storage utx:core function.schedule.in.executor
execute unless data storage utx:core function.schedule.in{executor:1b} run return 0

function utx:api/uuid/get
data modify storage utx:core function.schedule.in.executor set from storage utx:api out
