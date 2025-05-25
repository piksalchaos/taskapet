extends Control

@onready var task_name_edit: LineEdit = $PanelContainer/VBoxContainer/HBoxContainer/TaskNameEdit
@onready var importance_selector: OptionButton = $PanelContainer/VBoxContainer/HBoxContainer/ImportanceSelector

@onready var create_timed_task_button: Button = $PanelContainer/VBoxContainer/TabContainer/Timed/CreateTimedTaskButton
@onready var create_grind_task_button: Button = $PanelContainer/VBoxContainer/TabContainer/Grind/CreateGrindTaskButton

@onready var timed_task_minute_box: SpinBox = $PanelContainer/VBoxContainer/TabContainer/Timed/HBoxContainer/TimedTaskMinuteBox
@onready var grind_task_minute_box: SpinBox = $PanelContainer/VBoxContainer/TabContainer/Grind/HBoxContainer/GrindTaskMinuteBox

signal new_project_name(String)
signal new_timed_task_info(title: String, importance: Global.IMPORTANCE, minutes:int)
signal new_grind_task_info(title: String, importance: Global.IMPORTANCE, minutes:int)

func check_if_task_is_ready():
	var is_ready = task_name_edit.text.is_empty() \
		and (timed_task_minute_box.value != 0.0 or grind_task_minute_box.value != 0.0)
	create_timed_task_button.disabled = is_ready
	create_grind_task_button.disabled = is_ready

func _on_task_name_edit_text_changed(new_text: String) -> void:
	check_if_task_is_ready()

func close() -> void:
	hide()
	task_name_edit.text = ""
	timed_task_minute_box.value = 0.0
	grind_task_minute_box.value = 0.0

func _on_cancel_button_pressed() -> void:
	close()

func _on_create_timed_task_button_pressed() -> void:
	new_timed_task_info.emit(task_name_edit.text, importance_selector.selected, timed_task_minute_box.value)
	close()

func _on_create_grind_task_button_pressed() -> void:
	new_grind_task_info.emit(task_name_edit.text, importance_selector.selected, grind_task_minute_box.value)
	close()
