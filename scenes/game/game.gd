class_name Game
extends Node

static var ref: Game

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
	
	ref = self
	
var data : Data = Data.new()

#preloading star sprite for clickies
var clickable_star = preload("res://scenes/clickable_sprites/star.tscn")
