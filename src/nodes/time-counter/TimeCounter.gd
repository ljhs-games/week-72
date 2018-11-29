extends Label

const total_time = 30

var cur_time = 0.0

func _ready():
	set_process(true)

func _process(delta):
	cur_time += delta
	text = str(int(total_time - cur_time))