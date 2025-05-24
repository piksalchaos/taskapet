extends VBoxContainer

signal prompted_new_project

func _on_new_project_button_pressed() -> void:
	prompted_new_project.emit()
