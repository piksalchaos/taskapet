class_name LongTimer extends Timer

@export var seconds: int

func set_hms(h: int, m: int, s: int):
	set_wait_time(Global.hms_to_sec(Vector3(h, m, s)))

func get_hms_left() -> Vector3i:
	return Global.sec_to_hms(time_left)
