execute if data storage utx:core function.schedule.in{dimension:0b} run return run data remove storage utx:core function.schedule.in.dimension
execute unless data storage utx:core function.schedule.in{dimension:1b} run return 0

function utx:api/dimension/get
data modify storage utx:core function.schedule.in.dimension set from storage utx:api out
