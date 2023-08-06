$execute unless data storage utx:core function.schedule.ticks.$(gametime) run function utx:core/function/schedule/before/first {gametime:$(gametime),tick:$(tick)}

data remove storage utx:core function.schedule.in.tick
data modify storage utx:core function.schedule.ticks.$(gametime) append from storage utx:core function.schedule.in