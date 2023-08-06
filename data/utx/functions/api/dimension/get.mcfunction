#> utx:api/function/schedule
# 
# 実行位置のディメンション名を取得
# 
# modやdatapackでディメンションを追加する場合 #utx:callback/dimension 内にディメンション取得ファンクションを登録すること。
# ファンクションの内容は utx:core/dimension/get/callback 参照
# 
# @output storage utx:api out :: String ディメンション名
# @api

function #utx:callback/dimension