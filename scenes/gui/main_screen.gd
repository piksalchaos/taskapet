extends Control

const TASK_DISPLAY = preload("res://scenes/gui/task_display.tscn")

@onready var project_creator: Control = $ProjectCreator
@onready var task_creator: Control = $TaskCreator

@onready var side_bar: VBoxContainer = $MainDisplayContainer/SideBarContainer/SideBar

@onready var task_container: VBoxContainer = $MainDisplayContainer/TaskContainer
@onready var session_name_label: Label = $MainDisplayContainer/TaskContainer/SessionNameLabel
@onready var task_list: VBoxContainer = $MainDisplayContainer/TaskContainer/TaskList

signal new_project_name(name: String)
signal project_selected(project_name: String);

signal new_timed_task_info(title: String, importance: Global.IMPORTANCE, minutes:int)
signal new_grind_task_info(title: String, importance: Global.IMPORTANCE, minutes:int)

func _on_side_bar_prompted_new_project() -> void:
	project_creator.show()

func _on_add_task_button_pressed() -> void:
	task_creator.show()

@onready var health_bar: ProgressBar = $MainDisplayContainer/PetRoom/VBoxContainer/HealthBar
@onready var level_bar: ProgressBar = $MainDisplayContainer/PetRoom/VBoxContainer/LevelBar
@onready var level_label: Label = $MainDisplayContainer/PetRoom/VBoxContainer/Label

func change_health(health, max_health):
	health_bar.value = health / max_health
	print(health / max_health)

func change_exp(exp, max_exp, level):
	level_bar.value = exp / max_exp
	level_label.text = "Level " + str(level)

func _on_project_creator_new_project_name(name: String) -> void:
	new_project_name.emit(name)

func add_new_project_button(session_name: String):
	side_bar.add_new_project_button(session_name)

func _on_side_bar_project_selected(project_name: String) -> void:
	project_selected.emit(project_name)

func switch_session(session: Session):
	session_name_label.text = session.name
	for task_display in task_list.get_children():
		task_display.queue_free()
	for task: Task in session.get_children():
		add_to_task_list(task)
	task_container.show()

func _on_task_creator_new_grind_task_info(title: String, importance: int, minutes: int) -> void:
	new_grind_task_info.emit(title, importance, minutes)

func _on_task_creator_new_timed_task_info(title: String, importance: int, minutes: int) -> void:
	new_timed_task_info.emit(title, importance, minutes)

func add_to_task_list(task: Task):
	var task_display = TASK_DISPLAY.instantiate()
	task_display.task = task
	task_list.add_child(task_display)
