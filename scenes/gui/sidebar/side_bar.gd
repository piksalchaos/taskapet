extends VBoxContainer

const PROJECT_BUTTON = preload("res://scenes/gui/sidebar/project_button.tscn")

@onready var project_list: VBoxContainer = $ProjectList

signal prompted_new_project

func _on_new_project_button_pressed() -> void:
	prompted_new_project.emit()

func add_new_project_button(project_name: String):
	var project_button = PROJECT_BUTTON.instantiate()
	project_button.text = project_name
	project_list.add_child(project_button)
