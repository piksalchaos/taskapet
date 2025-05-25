extends Node



func _ready() -> void:
	pet.health_changed.connect(main_screen.change_health)
	pet.exp_changed.connect(main_screen.change_exp)

# session.time_changed.connect(gui.change_time)
const SESSION = preload("res://scenes/task/session/session.tscn")

@onready var pet: Pet = $Pet
@onready var session_container: Node = $SessionContainer
@onready var main_screen: Control = $MainScreen

var selected_session_name: String

func get_session(session_name: String):
	return session_container.find_child(session_name, true, false)
func get_current_session():
	return get_session(selected_session_name)

func _on_main_screen_new_project_name(name: String) -> void:
	var session = SESSION.instantiate()
	session.name = name
	session.pet = pet
	session.task_created.connect(on_session_task_created)
	session_container.add_child(session)

func _on_session_container_child_entered_tree(node: Node) -> void:
	main_screen.add_new_project_button(node.name)

func _on_main_screen_project_selected(project_name: String) -> void:
	selected_session_name = project_name
	var session = get_session(project_name)
	main_screen.switch_session(session)

func _on_main_screen_new_grind_task_info(title: String, importance: int, minutes: int) -> void:
	var session: Session = get_current_session()
	session.add_grind_task(title, importance, minutes)

func _on_main_screen_new_timed_task_info(title: String, importance: int, minutes: int) -> void:
	var session = get_current_session()
	session.add_timed_task(title, importance, minutes)

func on_session_task_created(task: Task):
	main_screen.add_to_task_list(task)
