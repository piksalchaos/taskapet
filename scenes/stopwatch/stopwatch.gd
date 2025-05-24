class_name Stopwatch extends Node

var start_time: int
var time_stored: int = 0

var is_stopped: bool = false

func start():
	start_time = Time.get_ticks_msec()
	is_stopped = false

func stop():
	time_stored += get_time_elapsed()
	is_stopped = true

func reset():
	is_stopped = true
	time_stored = 0

func get_time_elapsed() -> int:
	var time_elapsed = time_stored 
	
	if not is_stopped:
		time_elapsed += int((Time.get_ticks_msec() - start_time) / 1000)
	
	return time_elapsed

func get_hms_elapsed() -> Vector3i:
	return Global.sec_to_hms(get_time_elapsed())
