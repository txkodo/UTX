#> utx:api/function/schedule
# 
# ## 実行者/ディメンション/位置/角度/引数 を指定して実行
# 
# @input storage utx:api in.function   :: String - 実行するファンクション名
# @input storage utx:api in.arg?       :: Any - ファンクション実行時に渡す引数 (このデータが storage utx:api in に格納される) [省略可]
# @input storage utx:api in.executor?  :: String - 実行者のUUID文字列 [省略可]
# @input storage utx:api in.dimension? :: String - ディメンション文字列 [省略可]
# @input storage utx:api in.position?  :: [Double,Double,Double] - 座標値 [省略可]
# @input storage utx:api in.rotation?  :: [Float,Float] - 角度値 [省略可]

function utx:core/function/run/dimension/