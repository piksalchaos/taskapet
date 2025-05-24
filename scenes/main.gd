extends Node

@export var pet: Pet
@export var gui: Control

func _ready() -> void:
	pet.health_changed.connect(gui.change_health)
	pet.exp_changed.connect(gui.change_exp)
