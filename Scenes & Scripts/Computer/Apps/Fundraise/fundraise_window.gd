extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalScript.live_stream:
		%StartStreamButton.visible = false
		%LiveStreamWindow.texture = load("uid://bxdmufjm8k6lj")
		if GlobalScript.total_chickens > 0:
			%ChickenSprite.visible = true
		if GlobalScript.total_pigs > 0:
			%PigSprite.visble = true

func _on_start_stream_button_pressed() -> void:
	if GlobalScript.have_enclosure == true:
		GlobalScript.live_stream = true
		%StartStreamButton.hide()
		%LiveStreamWindow.texture = load("uid://bxdmufjm8k6lj") #changes background of live stream window to lowest tier of enclosure
		#upgrades based on the highest upgrade of enclosure 
