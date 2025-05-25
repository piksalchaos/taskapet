class_name Task extends Node2D

var title: String
var pts: int

var is_started: bool = false

signal started(task: Task)
signal failed(pts: int)
signal succeeded(pts: int)
signal time_changed(hms: Vector3i)

var current_hms: Vector3i

func get_display_hms():
	pass

func _process(delta: float) -> void:
	#if not is_started: return
	
	var hms = get_display_hms()
	print(hms)
	
	# if a second has passed, update time display
	if current_hms[2] != hms[2]:
		time_changed.emit(hms)
		current_hms = hms

func start():
	is_started = true
	on_start()
	started.emit(self)
	time_changed.emit(current_hms)

func stop():
	is_started = false
	on_stop()

func on_start():
	pass

func on_stop():
	pass

func fail(pts: int):
	is_started = false
	on_fail()
	failed.emit(pts)

func on_fail():
	pass

func succeed(pts: int):
	on_succeed()
	succeeded.emit(pts)

func on_succeed():
	pass

func on_new_day():
	pass

func remove():
	queue_free()
