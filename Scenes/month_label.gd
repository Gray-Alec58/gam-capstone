extends Label
#constantly updating label
func _process(_delta):
	text = GlobalClock.get_total_months()
