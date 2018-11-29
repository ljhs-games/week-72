extends Label

const total_time = 30

var cur_time = 0.0

func _ready():
	set_process(true)

func _process(delta):
	cur_time += delta
	text = str(int(total_time - cur_time))
	if cur_time >= total_time:
		get_tree().change_scene("res://scenes/End.tscn")