extends VBoxContainer

@onready var time_label: Label = $HBoxContainer/Time
@onready var play_button: TextureButton = $HBoxContainer/PlayButton

@export var task: Task

func _ready():
	await get_tree().create_timer(0.5).timeout
	task.time_changed.connect(change_time)
	print( "is conncected? " + str(task.time_changed.is_connected(change_time)))

func change_time(hms: Vector3i):
	var m = hms[1]
	var s = hms[2]
	time_label.text = "%02d:%02d" % [m, s]

func _on_play_button_pressed() -> void:
	if task.is_started == false:
		task.start()
		print('started!')
	else:
		task.stop()
		print('stopped!')
