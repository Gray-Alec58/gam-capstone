class_name DateTime extends Resource

@export_range (0,59) var seconds: int = 0
@export_range (0,59) var mintutes: int = 0
@export_range(0,23) var hours: int = 0
@export var days: int = 0

func increase_by_sec(delta_seconds: float) -> void
pass 
