class_name LongTimer extends Timer

@export var hours: int = 0
@export var minutes: int = 0

var seconds: int = 0

func set_time(hr: int, min: int):
	self.hours = hr
	self.minutes = min
	
	seconds = min * 60 + hours * 60 * 60
	
	set_wait_time(seconds)
