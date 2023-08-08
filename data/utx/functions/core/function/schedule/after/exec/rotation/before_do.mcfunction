data modify storage utx:core function.schedule.rot.x set string storage utx:core function.schedule.calls[-1].rotation[0] 0 -1
data modify storage utx:core function.schedule.rot.y set string storage utx:core function.schedule.calls[-1].rotation[1] 0 -1
function utx:core/function/schedule/after/exec/rotation/do with storage utx:core function.schedule.rot
