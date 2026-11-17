extends AudioStreamPlayer
@onready var click_sound = $ClickSound

func button_click_sound():
	$"../Click_sound".play()
