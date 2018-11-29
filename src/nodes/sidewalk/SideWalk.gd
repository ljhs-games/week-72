extends Sprite

const speed = 200.0

func _ready():
	set_process(true)

func _process(delta):
	region_rect.position.y += delta*speed