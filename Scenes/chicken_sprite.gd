extends AnimatedSprite2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%ChickenSprite.play("idle") #plays idle animation for chicken sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed*delta #calculates the position, making the sprite move across screen
	
	#changes the direction the sprite is facing 
	if position.x > 1000: #facing right
		%ChickenSprite.flip_h = false
		speed = -speed
	if position.x < 100: #facing left
		%ChickenSprite.flip_h = true
		speed = -speed
