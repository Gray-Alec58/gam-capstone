extends AnimatedSprite2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%ChickenSprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta
	
	
	if position.x > 1000:
		%ChickenSprite.flip_h = false
		speed = -speed
	if position.x < 100:
		%ChickenSprite.flip_h = true
		speed = -speed
