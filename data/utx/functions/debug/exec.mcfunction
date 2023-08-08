#> utx:debug/exec
# 
# 引数をutxのファンクションの引数指定をマクロで行い、実行結果をtellraw
# 
# デバッグ用
# 
# @macro function ファンクション名
# @macro arg ファンクションに渡したい引数 (storage utx:api in に設定したい内容)

$data modify storage utx:api in set value $(arg)
$function $(function)
