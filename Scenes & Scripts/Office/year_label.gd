extends Label

func _process(_delta):
	text = GlobalClock.get_total_years()
