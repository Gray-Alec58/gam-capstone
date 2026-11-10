extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_start_stream_button_pressed() -> void:
	if GlobalScript.have_enclosure == true:
		%StartStreamButton.hide()
		%LiveStreamWindow.texture = load("uid://bxdmufjm8k6lj") #changes background of live stream window to lowest tier of enclosure
		#upgrades based on the highest upgrade of enclosure 
