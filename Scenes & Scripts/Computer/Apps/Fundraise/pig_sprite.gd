extends AnimatedSprite2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%PigSprite.play("idle") #plays idle animation when sprite is visble

# Called every frame. 'delta' is the elapsed time since the previous frame.
#delta is a float
func _process(delta):
	position.x += speed*delta

	if position.x > 1000: #facing left
		%PigSprite.flip_h = true
		speed = -speed
	if position.x < 100:#facing right
		%PigSprite.flip_h = false
		speed = -speed
