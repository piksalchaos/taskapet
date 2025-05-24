class_name Task extends Node2D

var title: String = "Untitled task"
var description: String
var coins: int
var pts: int

var is_started: bool = false

signal started(task: Task)
signal failed(pts: int)
signal succeeded(pts: int)

func start():
	is_started = true
	on_start()
	started.emit(self)

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
