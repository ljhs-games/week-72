extends Node2D

const enemy_car_pack = preload("res://nodes/enemy-car/EnemyCar.tscn")

const time_range = Vector2(1.0, 2.0)

func _ready():
	$SpawnTimer.wait_time = rand_range(time_range.x, time_range.y)
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	var cur_enemy_car = enemy_car_pack.instance()
	add_child(cur_enemy_car)
	cur_enemy_car.global_position = Vector2(rand_range(32, 668), -200)
	$SpawnTimer.wait_time = rand_range(time_range.x, time_range.y)