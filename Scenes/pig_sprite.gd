extends AnimatedSprite2D

var speed = 200
var random_int = randi_range(100, 1000)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%PigSprite.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta

	if position.x > 1000:
		%PigSprite.flip_h = true
		speed = -speed
	if position.x < 100:
		%PigSprite.flip_h = false
		speed = -speed
