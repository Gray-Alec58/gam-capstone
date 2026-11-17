extends AnimatedSprite2D


@export var move_speed: float = 45.0
@export var wait_time: float = 1.0
@export var boundary_margin_x: float = 85.0
@export var boundary_margin_y: float = 75.0

var destination: Vector2
var moving: = false
var wait_timer: float = 0.0

var enclosure: Control
var chicken_id: int

func setup(enclosure_node: Control, id: int):
	enclosure = enclosure_node
	chicken_id = id


func _ready():
	randomize()
	if enclosure == null:
		return
	var rect = enclosure.get_global_rect()
	global_position = rect.get_center()
	visible = true
	play("Idle")
#making chicken move in random direction in the enclosure
func _process(delta):
	if not visible:
		return
	if moving:
		var direction = destination - global_position
		global_position = global_position.move_toward(
			destination,
			move_speed * delta
		)
		if abs(direction.x) > 1:
			flip_h = direction.x <0
		if global_position.distance_to(destination) <2.0:
			global_position = destination
			moving = false
			wait_timer = wait_time
			play("Idle")
	else:
		wait_timer -= delta
		if wait_timer <=0:
			choose_destination()

func choose_destination():
	if enclosure == null:
		return
	var rect = enclosure.get_global_rect()
	var min_x = rect.position.x + boundary_margin_x
	var max_x = rect.end.x - boundary_margin_x
	var min_y = rect.position.y + boundary_margin_y
	var max_y = rect.end.y - boundary_margin_y
	for attempt in range(50):
		var new_destination = Vector2(
			randf_range(min_x, max_x),
			randf_range(min_y, max_y)
			)
		if global_position.distance_to(new_destination) > 150:
			destination = new_destination
			GlobalScript.chicken_position[chicken_id] = global_position
			moving = true
			play("Idle")
			return
