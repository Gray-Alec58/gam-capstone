extends Node

var total_time: float = 0.0
#causes timer to constantly run despite scene changes
var timer_running: bool = false
var stream_start: bool = false

func _process(delta):
	if timer_running:
		total_time+= delta
		gain_gold()

func start_timer() -> void:
	timer_running = true
	#print("timer started in global")

func gain_gold() -> void:
	if(total_time > 15):
		var random_int = randi_range(1, 5)
		#var random_int = 5
		var donations = GlobalScript.total_animals * random_int
		GlobalScript.gold_increase(donations)
		total_time = 0.0
		#print("money gained")
