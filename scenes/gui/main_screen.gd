extends Control

@onready var project_creator: Control = $ProjectCreator
@onready var task_creator: Control = $TaskCreator

func _on_side_bar_prompted_new_project() -> void:
	project_creator.show()

func _on_add_task_button_pressed() -> void:
	task_creator.show()
