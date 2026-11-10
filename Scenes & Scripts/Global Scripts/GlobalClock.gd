extends Node

var total_time: float = 0.0
#causes timer to constantly run despite scene changes
var timer_running: bool = true
var total_months: int = 1
var total_years: int = 1

func _process(delta):
	if timer_running:
		total_time+= delta

func get_total_months() -> String:
	if total_time > 30.0: #seconds that pass for a month
		total_months+=1
		total_time = 0.0;
	if total_months > 12:
		total_years += 1
		total_months = 1
	
	var month
	
	if total_months == 1:
		month = "JANUARY"
	elif total_months == 2:
		month = "FEBRUARY"
	elif total_months == 3:
		month = "MARCH"
	elif total_months == 4:
		month = "APRIL"
	elif total_months == 5:
		month = "MAY"
	elif total_months == 6:
		month = "JUNE"
	elif total_months == 7:
		month = "JULY"
	elif total_months == 8:
		month = "AUGUST"
	elif total_months == 9:
		month = "SEPTEMBER"
	elif total_months == 10:
		month = "OCTOBER"
	elif total_months == 11:
		month = "NOVEMBER"
	elif total_months == 12:
		month = "DECEMBER"
	
	return month

func get_total_years() -> String:
	return "Year: " + str(total_years)
