function utx:core/function/schedule/after/exec/dimension/ with storage utx:core function.schedule.calls[-1]
data remove storage utx:core function.schedule.calls[-1]
execute if data storage utx:core function.schedule.calls[-1] run function utx:core/function/schedule/after/loop

