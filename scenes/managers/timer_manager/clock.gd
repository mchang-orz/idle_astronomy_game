class_name Clock
extends Node

#singleton reference
static var ref : Clock


#constructor
func _init() -> void:
	if not ref: ref = self
	else: queue_free()
	
signal ticked

var _tick_duration : float = 1.0
var _tick_progress : float = 0.0
	
func _process(delta: float) -> void:
	_tick_progress += delta
	
	if _tick_progress >= _tick_duration:
		_tick()
		
func _tick() -> void:
	while _tick_progress >= _tick_duration:
		_tick_progress -= _tick_duration
		ticked.emit()

	
	
