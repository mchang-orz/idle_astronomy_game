class_name PassiveGenerator
extends Node

static var ref: PassiveGenerator

func _init() -> void:
	if not ref: ref = self
	
	else: queue_free()
	
#every second should generate one star
var _cycle_duration : float = 1.0
var _cycle_progress : float = 0.0
var _passive_production : int = 1

var _locked : bool = true

func _ready() -> void:
	Clock.ref.ticked.connect(_clock_tick)

func _start_generator() -> void:
	if Game.ref.data.upgrade_passive == false:
		_locked = true
		return
	
	_locked = false

func _progress_cycles() -> void:
	if _locked: return
	
	_cycle_progress += 1.0
	
	if _cycle_progress >= _cycle_duration:
		_generate()

func _generate() -> void:
	_cycle_progress -= _cycle_duration
	
	ManagerStars.ref.create_stars(_passive_production)

func _clock_tick() -> void:
	_progress_cycles()
