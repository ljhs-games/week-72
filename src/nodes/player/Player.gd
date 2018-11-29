extends KinematicBody2D

const max_velocity = 400.0
const dampening = 40.0
const move_acceleration = 30.0 + dampening

enum DIRS { right, left, up, down }

var cur_dirs = { DIRS.right : 0, DIRS.left : 0, DIRS.up : 0, DIRS.down : 0 }
var velocity = Vector2()
var accel = Vector2()

func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta):
	accel.x = (cur_dirs[DIRS.right] + cur_dirs[DIRS.left])*move_acceleration
	accel.y = (cur_dirs[DIRS.up] + cur_dirs[DIRS.down])*move_acceleration
	velocity += accel
	velocity.x = clamp(velocity.x, -max_velocity, max_velocity)
	velocity.y = clamp(velocity.y, -max_velocity, max_velocity)
	velocity.x += bring_to_zero(velocity.x, dampening)
	velocity.y += bring_to_zero(velocity.y, dampening)
	move_and_collide(delta*velocity)
	print(global_position)

func _input(event):
	if event.is_action_pressed("g_left"):
		cur_dirs[DIRS.left] = -1
	elif event.is_action_released("g_left"):
		cur_dirs[DIRS.left] = 0
	elif event.is_action_pressed("g_right"):
		cur_dirs[DIRS.right] = 1
	elif event.is_action_released("g_right"):
		cur_dirs[DIRS.right] = 0
	elif event.is_action_pressed("g_up"):
		cur_dirs[DIRS.up] = -1
	elif event.is_action_released("g_up"):
		cur_dirs[DIRS.up] = 0
	elif event.is_action_pressed("g_down"):
		cur_dirs[DIRS.down] = 1
	elif event.is_action_released("g_down"):
		cur_dirs[DIRS.down] = 0

func bring_to_zero(cur_val, delta):
	if cur_val > delta:
		return -delta
	elif cur_val < -delta:
		return delta
	else:
		return -cur_val