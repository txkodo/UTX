#> utx:api/function/schedule
# 
# @input storage utx:api in.function :: String
# @input storage utx:api in.args :: Compound
# @input storage utx:api in.tick :: Int
# @input storage utx:api in.executor? :: String|Boolean|Null
# @input storage utx:api in.position? :: [Double,Double,Double]|Boolean|Null
# @input storage utx:api in.rotation? :: [Float,Float]|Boolean|Null
# @input storage utx:api in.dimension? :: String|Boolean|Null

data modify storage utx:core function.schedule.in set from storage utx:api in

execute store result score function.schedule.gametime utx run time query gametime
execute store result score function.schedule._ utx run data get storage utx:core function.schedule.in.tick
scoreboard players operation function.schedule.gametime utx += function.schedule._ utx

execute if data storage utx:core function.schedule.in.executor run function utx:core/function/schedule/option/executor
execute if data storage utx:core function.schedule.in.position run function utx:core/function/schedule/option/position
execute if data storage utx:core function.schedule.in.rotation run function utx:core/function/schedule/option/rotation
execute if data storage utx:core function.schedule.in.dimension run function utx:core/function/schedule/option/dimension

execute store result storage utx:core function.schedule.in.gametime int 1 run scoreboard players get function.schedule.gametime utx
function utx:core/function/schedule/before/subscribe with storage utx:core function.schedule.in
