data remove storage utx:api out[-1]
$data modify storage utx:core string.concat.loop.concat set value "$(last)$(concat)"
data modify storage utx:core string.concat.loop.last set from storage utx:api out[-1]
execute if data storage utx:api out[-1] run function utx:core/string/concat/loop with storage utx:core string.concat.loop