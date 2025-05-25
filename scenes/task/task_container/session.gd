class_name Session extends Node2D

@export var pet: Pet

@onready var current_day: int = get_day()
@onready var grind_task_scene = preload("res://scenes/task/grind_task/grind_task.tscn")
@onready var timed_task_scene = preload("res://scenes/task/timed_task/timed_task.tscn")

signal new_day()
signal task_created(task: Task)

func _on_child_entered_tree(node: Node) -> void:
	if not node is Task: return
	"res://scenes/task/task_container/session.tscn"
	node.started.connect(stop_tasks)
	node.failed.connect(pet.on_task_failed)
	node.succeeded.connect(pet.on_task_succeeded)
	new_day.connect(node.on_new_day)

func stop_tasks(started_task: Task):
	for task in get_children():
		if task != started_task:
			task.stop()

func add_grind_task(title: String, importance: Global.IMPORTANCE, minutes:int):
	var task = grind_task_scene.instantiate()
	task.title = title
	
	if importance == Global.IMPORTANCE.low:
		task.pts = 20
	elif importance == Global.IMPORTANCE.middle:
		task.pts = 40
	else:
		task.pts = 100
	
	task.goal_hms = Vector3i(0, minutes, 0)
	task.goal_time = minutes * 60
	add_child(task)
	task_created.emit(task)

func add_timed_task(title: String, importance: Global.IMPORTANCE, minutes:int):
	var task = timed_task_scene.instantiate()
	task.title = title
	
	if importance == Global.IMPORTANCE.low:
		task.pts = 20
	elif importance == Global.IMPORTANCE.middle:
		task.pts = 40
	else:
		task.pts = 100
	
	task.hms_set = Vector3i(0, minutes, 0)
	add_child(task)
	task_created.emit(task)


func remove_task(task_to_remove: Task):
	for task in get_children():
		if task == task_to_remove:
			task.remove()

func _process(delta: float) -> void:
	var day = get_day()
	if current_day != day:
		current_day = day
		new_day.emit()

func get_day() -> int:
	var datetime: String = Time.get_datetime_string_from_system()
	return Time.get_datetime_dict_from_datetime_string(datetime, false)['day']
