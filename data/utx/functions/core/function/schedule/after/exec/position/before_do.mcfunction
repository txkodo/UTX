data modify storage utx:core function.schedule.pos.x set string storage utx:core function.schedule.calls[-1].position[0] 0 -1
data modify storage utx:core function.schedule.pos.y set string storage utx:core function.schedule.calls[-1].position[1] 0 -1
data modify storage utx:core function.schedule.pos.z set string storage utx:core function.schedule.calls[-1].position[2] 0 -1
function utx:core/function/schedule/after/exec/position/do with storage utx:core function.schedule.pos
