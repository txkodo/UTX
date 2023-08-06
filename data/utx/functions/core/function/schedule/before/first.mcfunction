$data modify storage utx:core function.schedule.ticks.$(gametime) set value []
$schedule function utx:core/function/schedule/after/main $(tick) append
