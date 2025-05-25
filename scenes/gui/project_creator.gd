extends Control

@onready var create_button: Button = $PanelContainer/VBoxContainer/CreateButton
@onready var project_name_edit: LineEdit = $PanelContainer/VBoxContainer/ProjectNameEdit

signal new_project_name(name: String)

func _on_project_name_edit_text_changed(new_text: String) -> void:
	create_button.disabled = new_text.is_empty()

func close() -> void:
	hide()
	project_name_edit.text = ""

func _on_cancel_button_pressed() -> void:
	close()

func _on_create_button_pressed() -> void:
	new_project_name.emit(project_name_edit.text)
	close()
