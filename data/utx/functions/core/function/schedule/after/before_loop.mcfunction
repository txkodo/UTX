$data modify storage utx:core function.schedule.calls set from storage utx:core function.schedule.ticks.$(gametime)
$data remove storage utx:core function.schedule.ticks.$(gametime)
execute if data storage utx:core function.schedule.calls[-1] run function utx:core/function/schedule/after/loop with storage utx:core function.schedule.calls[-1]
data remove storage utx:core function.schedule.calls