extends Area2D

@onready var body = $Body
@onready var paw = $Paw
@onready var paw_trigger = $PawTriggerPoint

# How close the mouse needs to be to wake the cat
var hover_distance = 180.0

# How close the mouse needs to be to activate the paw
var paw_distance = 65.0

# Remember whether the cat is currently awake
var is_awake = false

# Remember whether the paw is currently activated
var paw_active = false

# Remember the body's original position
var body_start_position: Vector2


func _ready():
	body_start_position = body.position
	paw.visible = false


func _process(_delta):

	# Get the mouse's position in the game world
	var mouse_position = get_global_mouse_position()

	# Measure distance between mouse and cat
	var distance_to_cat = mouse_position.distance_to(body.global_position)

	# Measure distance between mouse and paw trigger point
	var distance_to_paw = mouse_position.distance_to(paw_trigger.global_position)


	# --- CAT BODY ---

	if distance_to_cat < hover_distance:
		if not is_awake:
			is_awake = true
			raise_cat()
	else:
		if is_awake:
			is_awake = false
			lower_cat()


	# --- PAW ---

	if distance_to_paw < paw_distance:
		if not paw_active:
			paw_active = true
			activate_paw()
	else:
		if paw_active:
			paw_active = false
			deactivate_paw()


func raise_cat():
	var tween = create_tween()
	tween.tween_property(body, "position:y", body_start_position.y - 35, 0.3)


func lower_cat():
	var tween = create_tween()
	tween.tween_property(body, "position:y", body_start_position.y, 0.3)


func activate_paw():
	paw.visible = true
	paw.play("Extend")


func deactivate_paw():
	paw.stop()
	paw.frame = 0
	paw.visible = false
