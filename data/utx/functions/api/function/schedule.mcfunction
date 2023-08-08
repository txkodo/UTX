#> utx:api/function/schedule
# 
# ## 実行者/ディメンション/位置/角度/引数 を指定してschedule
# 
# @input storage utx:api in.function :: String - 実行するファンクション名
# @input storage utx:api in.tick :: Int - 何チック後に実行するか
# @input storage utx:api in.arg? :: Any - ファンクション実行時に渡す引数 (このデータが storage utx:api in に格納される) [省略可]
# @input storage utx:api in.executor?  = false :: String|Boolean - 現在の実行者を反映させるかどうか or 実行者のUUID文字列 [省略可]
# @input storage utx:api in.dimension? = false :: String|Boolean|Null - 現在のディメンションを反映させるかどうか or ディメンション文字列 [省略可]
# @input storage utx:api in.position?  = false :: [Double,Double,Double]|Boolean|Null - 現在の座標を反映させるかどうか or 座標値 [省略可]
# @input storage utx:api in.rotation?  = false :: [Float,Float]|Boolean|Null - 現在の角度を反映させるかどうか or 角度値 [省略可]

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
