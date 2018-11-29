extends Sprite

var end_of_process = false # race condition with process, doesn't end with set_process

func _ready():
	ReloadTimer.connect("fire", self, "_on_AimMissile_fire")
	ReloadTimer.connect("reloaded", self, "_on_AimMissile_reloaded")
	set_process_input(true)
	set_process(false)

func _input(event):
	if event is InputEventMouseMotion:
		global_position = event.global_position
	elif event.is_action_pressed("fire") and !is_processing():
		ReloadTimer.fire(global_position)

func _on_AimMissile_fire(in_coords):
	set_process(true)
	end_of_process = false

func _on_AimMissile_reloaded():
	end_of_process = true

func _process(delta):
	modulate.a = (ReloadTimer.cur_reload_time/ReloadTimer.reload_time)
	if end_of_process:
		modulate.a = 1.0
		set_process(false)