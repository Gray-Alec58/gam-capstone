extends Node2D

@onready var money_counter = %DisplayMoneyCounter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num = randi_range(1, 5)
	#displays number counter for passive money gain when livestream works
	if (%StartStreamButton.visble == false && GlobalScript.total_animals > 0):
		GlobalScript.gold_increase(num)
		MoneyNumbers.display_number(num, money_counter.global_position)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
