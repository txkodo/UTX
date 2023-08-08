$data modify storage utx:api in set from storage utx:core function.schedule.ticks.$(gametime)
$data remove storage utx:core function.schedule.ticks.$(gametime)

function utx:api/list/reverse
data modify storage utx:core function.schedule.calls set from storage utx:api out
execute if data storage utx:core function.schedule.calls[-1] run function utx:core/function/schedule/after/loop
data remove storage utx:core function.schedule.calls
