class_name TimedTask extends Task

# inital time set in hours, minutes, seconds
var hms_set: Vector3i

# time left in hours, minutes, seconds
var hms_left: Vector3i

@onready var timer: LongTimer = $TimedTaskTimer

func _process(delta: float) -> void:
	hms_left = timer.get_hms_left()

func set_hms(h: int, m: int, s: int):
	hms_set = Vector3i(h, m, s)
	timer.hms(h, m, s)

func get_time_set() -> Vector3i:
	return hms_set

func get_time_left() -> Vector3i:
	return timer.get_hms_left()

func on_start():
	timer.start()

func on_stop():
	timer.stop()

func on_succeed():
	remove()

func _on_timed_task_timer_timeout() -> void:
	fail(pts)
