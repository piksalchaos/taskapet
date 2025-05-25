extends Node

@onready var pet: Pet = $Pet
@onready var main_screen: Control = $MainScreen

func _ready() -> void:
	pet.health_changed.connect(main_screen.change_health)
	pet.exp_changed.connect(main_screen.change_exp)

# session.time_changed.connect(gui.change_time)
