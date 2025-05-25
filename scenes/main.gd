extends Node



func _ready() -> void:
	pet.health_changed.connect(main_screen.change_health)
	pet.exp_changed.connect(main_screen.change_exp)

# session.time_changed.connect(gui.change_time)
const SESSION = preload("res://scenes/task/session/session.tscn")

@onready var pet: Pet = $Pet
@onready var session_container: Node = $SessionContainer
@onready var main_screen: Control = $MainScreen

func _on_main_screen_new_project_name(name: String) -> void:
	var session = SESSION.instantiate()
	session.name = name
	session_container.add_child(session)

func _on_session_container_child_entered_tree(node: Node) -> void:
	main_screen.add_new_project_button(node.name)
