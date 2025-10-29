class_name StarSpawner
extends Node

static var ref : StarSpawner

func _init() -> void:
	if not ref : ref = self
	
	else: queue_free()
	
var spawn_rate : float = 1.0

var spawn_progress : float = 0.0
	
func _ready() -> void:
	Clock.ref.ticked.connect(_clock_tick)
	
func _progress_star_spawn() -> void:
	spawn_progress += 1.0
	
	if spawn_progress >= spawn_rate:
		_spawn_star()
	
func _spawn_star() -> void:
	spawn_progress -= spawn_rate
	var new_star = Game.ref.clickable_star.instantiate()
	
	add_child(new_star)
	
func _clock_tick() -> void:
	_progress_star_spawn()
