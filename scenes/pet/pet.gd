class_name Pet extends Node2D

const MAX_HEALTH: int = 100
const PTS_PER_LEVEL: int = 50

var health: int = MAX_HEALTH
var level: int = 1
var exp_pts: int = 0


func on_task_failed(pts):
	health -= pts

func on_task_succeeded(pts):
	if health < MAX_HEALTH:
		health = clamp(health + pts, 0, MAX_HEALTH)
	else:
		exp_pts += pts
		if exp_pts >= PTS_PER_LEVEL:
			level += 1
			exp_pts %= PTS_PER_LEVEL
