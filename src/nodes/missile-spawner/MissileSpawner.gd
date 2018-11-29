extends Node2D

export (NodePath) var player_path

const missile_pack = preload("res://nodes/missile/Missile.tscn")
const pre_length = 10.0

onready var player_node = get_node(player_path)

func _ready():
	ReloadTimer.connect("fire", self, "_on_MissileSpawner_fire")

func _on_MissileSpawner_fire(in_coords):
	var cur_missile = missile_pack.instance()
	add_child(cur_missile)
	cur_missile.global_position = player_node.global_position
	cur_missile.global_position += (in_coords - player_node.global_position).normalized() * pre_length
	cur_missile.launch(player_node.global_position.angle_to_point(in_coords) + PI)