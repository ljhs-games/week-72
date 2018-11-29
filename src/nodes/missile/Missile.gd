extends Area2D

const acceleration = 5.0
const fade_speed = 1.0

var velocity = Vector2()
var rot_accel = Vector2()

func _ready():
	set_process(false)
	set_physics_process(false)

func launch(rot):
	rotation = rot
	rot_accel = Vector2(cos(rotation)*acceleration, sin(rotation)*acceleration)
	set_physics_process(true)

func _physics_process(delta):
	velocity += rot_accel*delta
	global_position += velocity

func _process(delta):
	modulate.a -= delta*fade_speed
	if modulate.a <= 0.0:
		queue_free()

func destroy():
	set_physics_process(false)
	set_process(true)

func _on_Missile_body_entered(body):
	if body.is_in_group("enemy"):
		body.destroy()
		destroy()

func _on_VisibilityNotifier2D_screen_exited():
	if is_processing():
		return
	queue_free()