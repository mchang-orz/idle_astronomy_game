class_name IdleClickPrototype
extends Control

@export 
var label : Label

func _ready() -> void:
	update_label()
	
func update_label() -> void:
	label.text = "STARS: %s" %Game.ref.data.stars

func _on_texture_button_pressed() -> void:
	ManagerClick.ref.click()
	update_label()
