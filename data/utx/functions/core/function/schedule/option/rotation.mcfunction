execute if data storage utx:core function.schedule.in{rotation:0b} run return run data remove storage utx:core function.schedule.in.rotation
execute unless data storage utx:core function.schedule.in{rotation:1b} run return 0
tp 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 0 0 0 ~ ~
data modify storage utx:core function.schedule.in.rotation set from entity 6fdcdba9-0a2d-4184-b201-8fd25f7edca8 Rotation
