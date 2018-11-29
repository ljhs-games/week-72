extends KinematicBody2D

const frequency_range = Vector2(4, 8)
const speed_range = Vector2(50,500)
const fade_time = 1.0


var time = 0.0

onready var frequency = rand_range(frequency_range.x, frequency_range.y)
onready var real_speed_range = Vector2(speed_range.x, rand_range(speed_range.x, speed_range.y))
onready var speed = real_speed_range.x

func _ready():
	set_physics_process(true)
	set_process(false)

func _physics_process(delta):
	time += delta
	move_and_collide(delta*Vector2(0, (speed+(sin(frequency*time)+1.0)*(real_speed_range.y-real_speed_range.x))))

func _process(delta):
	$Sprite.modulate.a -= fade_time*delta
	if $Sprite.modulate.a <= 0.0:
		queue_free()

func destroy():
	set_physics_process(false)
	set_process(true)

func _on_VisibilityNotifier2D_screen_exited():
	Score.place += 1
	queue_free()