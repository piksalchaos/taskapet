extends Button

signal project_selected(project_name: String)

func _on_pressed() -> void:
	project_selected.emit(text)
