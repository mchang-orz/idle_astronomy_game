class_name ManagerStars
extends Node

static var ref : ManagerStars

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
	
	ref = self

signal stars_created(quant : int)

var stars : int = 0

func create_stars(quant : int) -> void:
	stars += quant
	stars_created.emit(quant)
	
func get_stars() -> int:
	return stars
	
	
