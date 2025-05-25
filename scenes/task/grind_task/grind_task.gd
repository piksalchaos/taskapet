class_name GrindTask extends Task

# goal time in hours, minutes, seconds
var goal_hms: Vector3i
var goal_time: int

var hms_elapsed: Vector3i

@onready var stopwatch: Stopwatch = $GrindTaskStopwatch

var progress: PROGRESS = PROGRESS.NONE

enum PROGRESS {
	NONE,
	QUARTER,
	HALF
}

func get_display_hms():
	return hms_elapsed

func on_start():
	stopwatch.start()

func on_stop():
	stopwatch.stop()

func on_new_day():
	stopwatch.stop()
	if stopwatch.get_time_elapsed() < goal_time:
		fail(pts)
	stopwatch.reset()
	progress = PROGRESS.NONE


func _process(delta: float) -> void:
	hms_elapsed = stopwatch.get_hms_elapsed()
	
	if progress == PROGRESS.NONE and stopwatch.get_time_elapsed() % goal_time >= goal_time / 4:
		succeed(pts / 4)
		progress = PROGRESS.QUARTER
	elif progress == PROGRESS.QUARTER and stopwatch.get_time_elapsed() % goal_time >= goal_time / 2:
		succeed(pts / 2)
		progress = PROGRESS.HALF
	elif progress == PROGRESS.HALF and stopwatch.get_time_elapsed() % goal_time >= goal_time:
		succeed(pts)
		progress = PROGRESS.NONE
	
