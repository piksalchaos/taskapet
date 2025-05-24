extends Node

enum IMPORTANCE {
	low, middle, high
}

func sec_to_hms(sec: int) -> Vector3i:
	var h: int = sec / (60 * 60)
	var m: int = sec % (60 * 60) / 60
	var s: int = sec % 60
	return Vector3i(h, m, s)

#func hms_to_sec(h: int, m: int, s: int) -> int:
	#return s + (m * 60) + (h * 60 * 60)

func hms_to_sec(hms: Vector3i) -> int:
	var h = hms[0]
	var m = hms[1]
	var s = hms[2]
	
	return s + (m * 60) + (h * 60 * 60)
