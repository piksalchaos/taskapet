extends Node2D

var tasks: Array[Task]

var pet: Pet

@onready var current_day: int = get_day()

signal new_day()

func _on_child_entered_tree(node: Node) -> void:
	if not node is Task: return
	
	tasks.append(node)
	
	node.started.connect(stop_tasks)
	node.failed.connect(on_task_failed)
	new_day.connect(node.on_new_day)

func stop_tasks(started_task: Task):
	for task in tasks:
		if task != started_task:
			task.stop()

func on_task_failed():
	pass

func remove_task(task_to_remove: Task):
	for i in range(tasks.size()):
		if tasks[i] == task_to_remove:
			tasks[i].remove()
			tasks.pop_at(i)

func _process(delta: float) -> void:
	var day = get_day()
	if current_day != day:
		current_day = day
		new_day.emit()

func get_day() -> int:
	var datetime: String = Time.get_datetime_string_from_system()
	return Time.get_datetime_dict_from_datetime_string(datetime, false)['day']
