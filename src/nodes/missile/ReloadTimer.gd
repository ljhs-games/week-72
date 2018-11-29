extends Node

signal reloaded
signal fire(in_coords)

const reload_time = 1.0

var cur_reload_time = 0.0

func _ready():
	set_process(false)

func fire(in_coords):
	emit_signal("fire", in_coords)
	set_process(true)

func _process(delta):
	cur_reload_time += delta
	if cur_reload_time >= reload_time:
		emit_signal("reloaded")
		cur_reload_time = 0.0
		set_process(false)