extends Control

@onready var project_creator: Control = $ProjectCreator
@onready var task_creator: Control = $TaskCreator

@onready var side_bar: VBoxContainer = $MainDisplayContainer/SideBarContainer/SideBar

signal new_project_name(name: String)

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
	pass # Replace with function body.
