#> utx:api/string/concat
#  
# 文字列を解決
# 
# @input  storage utx:api in :: String 解決したい文字列(JsonString)
# @output storage utx:api out :: List[String]
# @api

item modify entity 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 container.0 utx:core/string/resolve/name
data modify storage utx:api out set from entity 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 Item.tag.display.Name
data remove storage utx:api in