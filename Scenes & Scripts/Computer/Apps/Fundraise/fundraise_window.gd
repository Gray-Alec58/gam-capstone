extends MarginContainer

var total_donations: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if MoneyNumbers.stream_start:
		%StartStreamButton.visible = false
		%LiveStreamWindow.texture = load("uid://bxdmufjm8k6lj")
		GlobalScript.chicken_visible.connect(chicken_sprite_visible)
		chicken_sprite_visible()

func _on_start_stream_button_pressed() -> void:
	if GlobalScript.have_enclosure == true:
		MoneyNumbers.stream_start = true
		%StartStreamButton.hide()
		%LiveStreamWindow.texture = load("uid://bxdmufjm8k6lj") #changes background of live stream window to lowest tier of enclosure
		#upgrades based on the highest upgrade of enclosure 
		GlobalScript.chicken_visible.connect(chicken_sprite_visible)
		chicken_sprite_visible()

func chicken_sprite_visible() -> void:
	if GlobalScript.total_chickens > 0:
			%ChickenSprite.visible = true
			start_livestream()

func start_livestream() -> void:
	if %ChickenSprite.visible:
		MoneyNumbers.start_timer()
		#print("Timer starts in Fundraise")

#func _on_close_window_button_pressed() -> void:
	#%"FundraiseWindow".visible = false
