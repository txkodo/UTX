data modify storage utx:core function.schedule.pos.x set string storage utx:api in.position[0] 0 -1
data modify storage utx:core function.schedule.pos.y set string storage utx:api in.position[1] 0 -1
data modify storage utx:core function.schedule.pos.z set string storage utx:api in.position[2] 0 -1
function utx:core/function/run/position/do with storage utx:core function.schedule.pos
