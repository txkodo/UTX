#> utx:core/util/uuid.get/main
# @output stoarge utx:core uuid.get.uuid: StringTag

item modify entity 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 container.0 utx:core/uuid/get/set_name
data modify storage utx:core uuid.get.name set from entity 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 Item.tag.display.Name

# ENTITY
execute if entity @s[type=!player] run return run data modify storage utx:api out set string storage utx:core uuid.get.name 14 50

# PLAYER
execute store result storage utx:core uuid.get.len int 0.5 run data get storage utx:core uuid.get.name
execute store result score uuid.get.len utx run data get storage utx:core uuid.get.len
execute store result score uuid.get.start utx store result score uuid.get.end utx run scoreboard players remove uuid.get.len utx 113
execute store result storage utx:core uuid.get.slice.start int 1 run scoreboard players add uuid.get.start utx 157
execute store result storage utx:core uuid.get.slice.end int 1 run scoreboard players add uuid.get.end utx 193
function utx:core/uuid/get/slice with storage utx:core uuid.get.slice
