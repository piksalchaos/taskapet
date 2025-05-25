extends VBoxContainer

@onready var time_label: Label = $HBoxContainer/Time
@onready var play_button: TextureButton = $HBoxContainer/PlayButton

@export var task: Task

func _ready():
	task.time_changed.connect(change_time)

func change_time(h: int, m: int, s: int):
	time_label.text = "%02d:%02d" % [m, s]
