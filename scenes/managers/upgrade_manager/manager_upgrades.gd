class_name ManagerUpgrades
extends Node

static var ref : ManagerUpgrades

func _enter_tree() -> void:
	if ref:
		queue_free()
		return
	
	ref = self
	
var passivegen_cost : int = 10

	
