class_name Pet extends Node2D

const MAX_HEALTH: int = 100
const PTS_PER_LEVEL: int = 50

var health: int = MAX_HEALTH
var level: int = 1
var exp: int = 0

signal health_changed(health, max_health)
signal exp_changed(exp, max_exp, level)

func on_task_failed(pts):
	health = clamp(health - pts, 0, MAX_HEALTH)
	health_changed.emit(health, MAX_HEALTH)

func on_task_succeeded(pts):
	if health < MAX_HEALTH:
		health = clamp(health + pts, 0, MAX_HEALTH)
		health_changed.emit(health, MAX_HEALTH)
	else:
		exp += pts
		if exp >= PTS_PER_LEVEL:
			level += 1
			exp %= PTS_PER_LEVEL
		exp_changed.emit(exp, PTS_PER_LEVEL, level)
